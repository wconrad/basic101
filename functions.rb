require_relative 'abs_function'
require_relative 'asc_function'
require_relative 'chr_function'
require_relative 'int_function'
require_relative 'left_function'
require_relative 'len_function'
require_relative 'mid_function'
require_relative 'right_function'
require_relative 'rnd_function'
require_relative 'str_function'
require_relative 'tab_function'
require_relative 'val_function'

module Basic

  module Functions

    FUNCTIONS = {
      'ABS' => AbsFunction.new,
      'ASC' => AscFunction.new,
      'CHR$' => ChrFunction.new,
      'INT' => IntFunction.new,
      'LEFT$' => LeftFunction.new,
      'LEN' => LenFunction.new,
      'MID$' => MidFunction.new,
      'RIGHT$' => RightFunction.new,
      'RND' => RndFunction.new,
      'STR$' => StrFunction.new,
      'TAB' => TabFunction.new,
      'VAL' => ValFunction.new,
    }

  end

end
