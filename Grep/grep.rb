class Grep
  attr_reader :pattern, :flags, :files
  def initialize(pattern, flags, files)
    @pattern = pattern
    @flags = flags
    @files = files
  end

  def self.grep(pattern, flags, files)
    new(pattern, flags, files).grep
  end

  def grep
    answer = []
    files.each do |file|
      File.readlines(file).each_with_index do |line, index|
        next unless match?(line)

        result = line.chomp
        result = "#{index + 1}:" + result if line_numbers?
        result = "#{file}:" + result if several_files?
        result = file.to_s if only_file_names?
        answer << result
      end
    end
    answer.uniq.join("\n")
  end

  def match?(line)
    inversive_search? ? line !~ expression : line =~ expression
  end

  def expression
    insensitive_register? ? /#{check_pattern}/i : /#{check_pattern}/
  end

  def check_pattern
    full_line_match? ? "^#{pattern}$" : pattern
  end

  def full_line_match?
    flags.include?('-x')
  end

  def inversive_search?
    flags.include?('-v')
  end

  def insensitive_register?
    flags.include?('-i')
  end

  def line_numbers?
    flags.include?('-n')
  end

  def several_files?
    files.size > 1
  end

  def only_file_names?
    flags.include?('-l')
  end
end
