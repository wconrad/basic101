module Basic

  module BuiltInFunctions

    def self.make
      [
        AbsFunction,
        AscFunction,
        ChrFunction,
        ExpFunction,
        IntFunction,
        LeftFunction,
        LenFunction,
        MidFunction,
        RightFunction,
        RndFunction,
        SqrFunction,
        StrFunction,
        TabFunction,
        ValFunction,
      ].map(&:new)
    end

  end

end
