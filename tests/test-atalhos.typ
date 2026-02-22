#import "../lib.typ": *

= Testes v2

== ee()

- `$6,022 ee(23)$` → $6,022 ee(23)$
- `$1,602 ee(-19)$` → $1,602 ee(-19)$

== Unidades com espaço fino embutido

- `$9,8 mss$` → $9,8 mss$
- `$25 msq$` → $25 msq$
- `$120 kmh$` → $120 kmh$
- `$1000 kgm$` → $1000 kgm$
- `$6,022 ee(23) molinv$` → $6,022 ee(23) molinv$
- `$8,314 jmol$` → $8,314 jmol$

== Comparação de digitação

#table(
  columns: (auto, auto, auto),
  align: (left, left, center),
  stroke: 0.5pt,
  inset: 6pt,
  [*Typst puro*], [*Com atalho*], [*Resultado*],
  [`$9,8 "m/s"^2$`], [`$9,8 mss$`], [$9,8 mss$],
  [`$25 "m"^2$`], [`$25 msq$`], [$25 msq$],
  [`$120 "km/h"$`], [`$120 kmh$`], [$120 kmh$],
  [`$6,022 times 10^23$`], [`$6,022 ee(23)$`], [$6,022 ee(23)$],
  [`$6,022 times 10^23 "mol"^(-1)$`], [`$6,022 ee(23) molinv$`], [$6,022 ee(23) molinv$],
)
