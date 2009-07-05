#!/usr/bin/ruby

# Rejustifies a text file with the specified length (default = 60).
#
# Assumes 2 consecutive newlines signify end of paragraph.
# All other lines are joined (with a single space if there
# isn't already a space there, and then broken at the specified
# length.


paragraph_arrays = []

def is_empty_line(line)
  (line =~ /^[ \n]*$/) != nil 
end


def is_valid_linenum(lines, linenum)
  lines.size == 0 ? false : (0...lines.size) === linenum
end


def process_paragraph(par_lines, max_line_length)

  long_line = par_lines.join ' '
  lines  = []

  while long_line.size > 0

    if long_line.size <= max_line_length
      lines << long_line
      long_line = ''
    else
      break_pos = max_line_length
      
      while break_pos > 0 && long_line[break_pos..break_pos] != ' '
	break_pos = break_pos - 1
      end
      lines << long_line[0...break_pos]
      long_line = long_line[break_pos..-1].strip
    end
  end
  lines
end


def get_paragraphs(lines)
  paragraph_linenums = []
  paragraphs = []
  line_cursor = 0
  while line_cursor < lines.size do
    if is_empty_line(lines[line_cursor])
      if not paragraph_linenums.empty?
        paragraph_lines = lines[paragraph_linenums[0]..paragraph_linenums[-1]]
        paragraphs << process_paragraph(paragraph_lines, 65)
        paragraph_linenums = []
      end
    else
      paragraph_linenums << line_cursor
    end
    line_cursor = line_cursor + 1

  end
  paragraphs
end


def load_lines(filespec)
  lines = []
  orig_lines = IO.readlines filespec
  orig_lines.each do |line|
    line.chomp!.rstrip!
    lines << line
  end
  lines
end


def run(filespec)
  lines = load_lines filespec
  paras = get_paragraphs lines
  paras.each do |para|
    puts para
    puts
  end
end

run ARGV[0]

