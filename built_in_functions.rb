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
        LogFunction,
        MidFunction,
        RightFunction,
        RndFunction,
        SgnFunction,
        SqrFunction,
        StrFunction,
        TabFunction,
        ValFunction,
      ].map(&:new)
    end

  end

end
