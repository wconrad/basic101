require_relative 'int_function'
require_relative 'left_function'
require_relative 'len_function'
require_relative 'mid_function'
require_relative 'rnd_function'
require_relative 'tab_function'
require_relative 'val_function'

module Basic

  module Functions

    FUNCTIONS = {
      'INT' => IntFunction.new,
      'LEFT$' => LeftFunction.new,
      'LEN' => LenFunction.new,
      'MID$' => MidFunction.new,
      'RND' => RndFunction.new,
      'TAB' => TabFunction.new,
      'VAL' => ValFunction.new,
    }

  end

end
