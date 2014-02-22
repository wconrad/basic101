module Basic101

  module BuiltInFunctions

    def self.make
      [
        AbsFunction,
        AscFunction,
        ChrFunction,
        CosFunction,
        ExpFunction,
        IntFunction,
        LeftFunction,
        LenFunction,
        LogFunction,
        MidFunction,
        RightFunction,
        RndFunction,
        SgnFunction,
        SinFunction,
        SqrFunction,
        StrFunction,
        TabFunction,
        TanFunction,
        ValFunction,
      ].map(&:new)
    end

  end

end
