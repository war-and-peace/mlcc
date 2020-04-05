structure Abst =
struct

type identifier = string

datatype exp =    VarExp of identifier
                | IntExp of int
                | FuncCallExp of {
                    func: identifier,
                    args: exp list
                  }
                | IfCallExp of {
                    oper: if_oper,
                    pred: bool_exp,
                    left: exp,
                    right: exp
                  }
                | BoolExp of bool_exp
                | SeqExp of exp list

        and bool_exp = OpCallExp of {
                    optype: bool_oper,
                    left: exp,
                    right: exp
                  }
                  | bool

        and defnition = FunDef of {
            name: identifier,
            args: identifier list,
            body: exp
          }
        | VarDef of {
          var: identifier,
          value: exp
          }

        and oper = PlusOp | MinusOp | TimesOp | DivideOp
        and bool_oper = EqOp | LtOp | GtOp
        and if_oper = IfOp
end
