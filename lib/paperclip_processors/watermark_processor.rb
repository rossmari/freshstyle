module Paperclip
  class WatermarkProcessor < Processor
    GRAVITY_VALID_VALUES = %w(NorthWest North NorthEast West Center East SouthWest South SouthEast)

    def initialize file, options = {}, attachment = nil
      super
      @current_format = File.extname(@file.path)
      @basename = File.basename(@file.path, @current_format)
      @format = options[:format]
    end

    def make
      src = @file
      dst = Tempfile.new([@basename, @format ? ".#{@format}" : ''])
      dst.binmode
      define_watermark_options
      build_command(src, dst)
      run_command
      dst
    end

    private

    def define_watermark_options
      if @options.is_a?(Hash) && @options[:watermarks].is_a?(Array) && @options[:watermarks].any?
        @watermarks = @options[:watermarks]
      else
        raise 'option :watermarks is not specified'
      end
    end

    def build_command(src_file, dst_file)
      commands = []

      @watermarks.each_with_index do |watermark_options, i|
        raise 'one of the parameters :path is not specified' if watermark_options[:path].blank?

        path = check_path_options(watermark_options)
        gravity = check_gravity_value(watermark_options)
        transparency = check_transparency_value(watermark_options)
        offsets = check_offsets_value(watermark_options)

        command = "composite -dissolve #{transparency} -gravity #{gravity} "
        command << "-geometry #{offsets} " if offsets.present?
        command << "'#{File.expand_path(path)}' #{i == 0 ? "'#{File.expand_path(src_file.path)}[0]'" : '-'}"

        commands << command
      end

      if commands.length > 1
        @command = commands.join(" jpg:- | ") << " '#{File.expand_path(dst_file.path)}'"
      else
        @command = commands[0] << " '#{File.expand_path(dst_file.path)}'"
      end
    end

    def run_command
      begin
        Paperclip.run(@command)
      rescue Exception => ex
        raise "There was an error processing the watermark for #{@basename}: #{@command}"
      end
    end

    def check_offsets_value(watermark_options)
      return '' if watermark_options[:offsets].blank?
      offsets = watermark_options[:offsets].to_s
      return offsets if offsets =~ /^[+-]\d+[-+]\d+$/
      raise "One of the parameters :offsets has invalid value: #{offsets}. Valid values has format like +10+15 or -10+30 etc."
    end

    def check_transparency_value(watermark_options)
      return '100%' if watermark_options[:transparency].blank?
      transparency = watermark_options[:transparency].to_s
      return transparency if transparency =~ /^\d+%$/ && transparency.to_i <= 100
      raise "One of the parameters :transparency has invalid value: #{transparency}. Available only 0%-100% vales or empty value by default (100%)"
    end

    def check_path_options(watermark_options)
      path = Rails.root + 'app' + 'assets' + 'images' + watermark_options[:path].to_s
      return path if File.exist?(path)
      raise "file #{path} is not found"
    end

    def check_gravity_value(watermark_options)
      raise 'one of the parameters :gravity is not specified' if watermark_options[:gravity].blank?
      gravity_str = watermark_options[:gravity].to_s
      return gravity_str if GRAVITY_VALID_VALUES.member?(gravity_str)
      raise "One of the parameters :gravity has invalid value: #{gravity_str}. Use one of the following values #{GRAVITY_VALID_VALUES.join(' ')}"
    end

  end

end