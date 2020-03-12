type identifier = string
datatype let_type = LET | LET_STAR | LET_REC

datatype value = NIL
               | BOOL of bool
               | NUM of int
               | CLOSURE of
                   ((identifier list) * exp) * ((identifier * int) list)
               | PRIMITIVE of identifier
               | UNDEFINED
               (*
               | S_EXP of s_exp
               | S_EXP_LIT of value
               | S_EXP_SYM of identifier
               | S_EXP_LIST of value list
               | PAIR of value * value
               list)
               | PRIMITIVE of string
               *)
and

s_exp = S_EXP_INT of int
      | S_EXP_BOOL of bool
      | S_EXP_SYM of identifier
      | S_EXP_LIST of s_exp list

and

exp = LIT of value
             | VAR of identifier
             | APPLY of exp * (exp list)
             | LAMBDA of lambda
             (*
             | SET of identifier * exp
             | IFX of exp * exp * exp
             | WHILEX of exp * exp
             | BEGIN of exp list
             | LETX of let_type * (identifier list) * (exp list) * exp
             *)
             withtype lambda = (identifier list) * exp

datatype def = VAL of identifier * exp
             | EXP of exp
             | DEFINE of identifier * lambda

val primitive_funcs_arity =
  [("=", 2), ("+", 2), ("-", 2), ("*", 2), ("/", 2), ("print", 1),
   ("if", 3), ("lambda", 2), (">", 2), ("<", 2)]

val reserved_idents = ["if", "lambda"]
val primitive_funcs =
  ["=", "+", "-", "*", "/", "<", ">", "print", "check-expect", "mod", "not",
   "and", "or"]
(*val primitive_funcs = List.map (fn (oper, _) => oper) primitive_funcs_arity*)
val primitive_funcs = reserved_idents @ primitive_funcs
