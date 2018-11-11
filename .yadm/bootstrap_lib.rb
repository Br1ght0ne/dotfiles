require 'colorize'
require 'git'
require 'logger'

# Replacing shell scripts in `yadm bootstrap` with style.
class Bootstrap
  def initialize(options = {})
    @options = options
    @log = Logger.new(STDERR)
    @log.progname = ''
    @log.formatter = proc do |severity, _datetime, progname, msg|
      ['==>'.light_white,
       "#{progname}:".colorize(log_colors[severity]),
       msg].join(' ') + "\n"
    end
  end

  private

  def log_colors
    {
      'DEBUG' => :light_black,
      'INFO' => :green,
      'WARN' => :light_yellow,
      'ERROR' => :red,
      'FATAL' => :red
    }
  end

  def install_methods
    {
      pip: 'pip install %<options>s %<package>s',
      emerge: 'sudo emerge %<options>s %<package>s',
      pacman: 'sudo pacman -S %<options>s %<package>s',
      yay: 'yay -S %<options>s %<package>s',
      script: 'sh -c "$(curl -fsSL %<options>s %<package>s)"'
    }
  end

  def install_methods_for(package, options = [])
    install_methods.map do |method, str|
      [method, format(str, package: package, options: options.join(' '))]
    end.to_h
  end

  public

  def self.run(options = {}, &block)
    new(options).instance_eval(&block)
  end

  def category(name, &block)
    old_progname = @log.progname.dup
    @log.progname =
      if @log.progname.empty?
        name
      else
        "#{@log.progname}/#{name}"
      end
    instance_eval(&block) if block
    @log.progname = old_progname
  end

  %i[debug info warn error fatal].each do |level|
    define_method(level) do |msg|
      return if level == :debug && !@options[:verbose]

      @log.public_send(level, msg)
    end
  end

  def action(text, &block)
    instance_eval(&block)
    info(text)
  end

  def execute(command)
    options = {}
    options[:out] = '/dev/null' unless @options[:verbose]
    error "failed to execute `#{command}`" unless system(command, options)
  end

  def install(package, method:, options: [])
    command = install_methods_for(package, options).fetch(method) do
      error("install method '#{method}' not implemented")
      return
    end

    debug("running '#{command}'")
    execute(command)
  end
end

def clone(url, path)
  expanded_path = File.expand_path(path)
  if Dir.exist?(expanded_path)
    debug("path #{path} already exists")
  else
    Git.clone(url, expanded_path)
  end
end
