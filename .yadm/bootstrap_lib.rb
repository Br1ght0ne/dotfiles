require 'colorize'
require 'git'
require 'logger'

# rubocop:disable Metrics/ClassLength

# Replacing shell scripts in `yadm bootstrap` with style.
class Bootstrap
  class << self
    def run(options = {}, &block)
      new(options).instance_eval do
        info('start')
        debug("options: #{options}")
        instance_eval(&block)
        handle_errors
      end
    end

    def log_levels
      LOG_COLORS.keys.map(&:downcase).map(&:to_sym)
    end

    def install_backends
      INSTALL_METHODS.keys
    end
  end

  LOG_COLORS = {
    'DEBUG' => :light_black,
    'INFO' => :green,
    'WARN' => :light_yellow,
    'ERROR' => :red,
    'FATAL' => :red
  }.freeze

  INSTALL_METHODS = {
    emerge: 'sudo emerge %<options>s %<package>s',
    pacman: 'sudo pacman -S %<options>s %<package>s',
    pip: 'pip install %<options>s %<package>s',
    script: 'sh -c "$(curl -fsSL %<options>s %<package>s)"',
    yay: 'yay -S %<options>s %<package>s'
  }.freeze

  private_constant :LOG_COLORS, :INSTALL_METHODS

  private

  def initialize(options = {})
    @options = options
    @log = Logger.new(STDERR)
    @log.progname = 'bootstrap'
    @errors = []
    @warnings = []
    @log.formatter = proc do |severity, _datetime, progname, msg|
      ['==>'.light_white,
       "#{progname}:".colorize(LOG_COLORS[severity]),
       msg].join(' ') + "\n"
    end
  end

  def install_methods_for(package, options = [])
    INSTALL_METHODS.map do |method, str|
      [method, format(str, package: package, options: options.join(' '))]
    end.to_h
  end

  def with_progname(new_progname)
    old_progname = @log.progname.dup
    @log.progname = new_progname
    yield
    @log.progname = old_progname
  end

  def handle_errors
    if @errors.any?
      fatal("failed (#{@errors.count} errors, #{@warnings.count} warnings)")
      if options[:verbose]
        @errors.each do |level, progname, action, msg|
          fatal("#{level}: #{msg} (#{progname}: #{action})")
        end
      end
    else
      info("success (#{@errors.count} errors, #{@warnings.count} warnings)")
    end
  end

  def category(name, &block)
    new_progname =
      if @log.progname.empty? || @log.progname == 'bootstrap'
        name
      else
        "#{@log.progname}/#{name}"
      end
    with_progname(new_progname) do
      instance_eval(&block) if block
    end
  end

  %i[debug info warn error fatal].each do |level|
    define_method(level) do |msg|
      return if level == :debug && !@options[:verbose]

      @errors << [level, @log.progname.dup, @action, msg] if level == :error
      @warnings << [level, @log.progname.dup, @action, msg] if level == :warn

      @log.public_send(level, msg)
    end
  end

  def action(text, &block)
    error_count = @errors.count.dup
    @action = text
    instance_eval(&block)
    if @errors.count > error_count
      # fatal(text)
      debug("'#{@action}' failed with #{@errors.count - error_count} errors")
    else
      info(text)
    end
  end

  def execute(command)
    options = {}
    options[:out] = '/dev/null' unless @options[:verbose]
    debug("executing '#{command}'")
    error "failed to execute '#{command}'" unless system(command, options)
  end

  def install(package, method:, options: [])
    command = install_methods_for(package, options).fetch(method) do
      error("install method '#{method}' not implemented")
      return
    end

    debug("installing #{package} (method: #{method}, options: #{options})")
    execute(command)
  end

  def clone(url, path)
    expanded_path = File.expand_path(path)
    debug("request to clone: #{url}")
    if Dir.exist?(expanded_path)
      debug("path #{path} already exists")
    else
      debug("cloning to #{expanded_path}")
      Git.clone(url, expanded_path)
    end
  end
end

# rubocop:enable Metrics/ClassLength
