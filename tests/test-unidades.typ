#import "../lib.typ": *

#set page(paper: "a4", margin: 2cm)
#set text(size: 12pt, lang: "pt", region: "BR")

= Testes do módulo de unidades

== Formatação de números (`num`)

=== Básico — vírgula decimal e agrupamento

- `num(3.14159)` → #num(3.14159)
- `num(1234567.89)` → #num(1234567.89)
- `num(1000)` → #num(1000) _(sem agrupamento, menos de 5 dígitos)_
- `num(10000)` → #num(10000) _(10 000)_
- `num(100)` → #num(100)
- `num(0.5)` → #num(0.5)
- `num(-42.7)` → #num(-42.7) _(sinal menos tipográfico)_
- `num(0)` → #num(0)

=== Notação científica

- `num(299800000, notacao: "cientifica")` → #num(299800000, notacao: "cientifica")
- `num(0.0000056, notacao: "cientifica")` → #num(0.0000056, notacao: "cientifica")
- `num(6.022e23)` → #num(6.022e23) _(sem aspas, acima do limiar)_
- `num(1.602e-19)` → #num(1.602e-19) _(sem aspas, abaixo do limiar)_
- `num("2.998e8")` → #num("2.998e8") _(com aspas, preserva notação)_
- `num(1e10)` → #num(1e10) _(auto, acima do limiar)_

=== Notação científica — supressão de expoente 0 e mantissa 1

- `num(5.0, notacao: "cientifica")` → #num(5.0, notacao: "cientifica")

=== Valores especiais

- `num(float("nan"))` → #num(float("nan"))
- `num(float("inf"))` → #num(float("inf"))
- `num(-float("inf"))` → #num(-float("inf"))

== Unidades (`unidade`)

=== Unidades simples

- `unidade("m")` → #unidade("m")
- `unidade("kg")` → #unidade("kg")
- `unidade("Hz")` → #unidade("Hz")

=== Potências

- `unidade("m^2")` → #unidade("m^2")
- `unidade("m^3")` → #unidade("m^3")
- `unidade("s^-1")` → #unidade("s^-1")

=== Compostas

- `unidade("m/s")` → #unidade("m/s")
- `unidade("m/s^2")` → #unidade("m/s^2")
- `unidade("kg.m/s^2")` → #unidade("kg.m/s^2")
- `unidade("J/(kg.K)")` → #unidade("J/(kg.K)")

=== Com prefixos

- `unidade("km")` → #unidade("km")
- `unidade("MHz")` → #unidade("MHz")
- `unidade("µm")` → #unidade("µm")
- `unidade("kW")` → #unidade("kW")
- `unidade("mL")` → #unidade("mL")

=== Modo "produto" (tudo com expoentes)

- `unidade("m/s^2", modo: "produto")` → #unidade("m/s^2", modo: "produto")

== Quantidades (`qtd`)

- `qtd(9.8, "m/s^2")` → #qtd(9.8, "m/s^2")
- `qtd(3.14, "rad")` → #qtd(3.14, "rad")
- `qtd(220, "V")` → #qtd(220, "V")
- `qtd(1500, "rpm")` → #qtd(1500, "rpm")
- `qtd(25.0, "°C")` → #qtd(25.0, "°C")
- `qtd(6.022e23, "mol^-1")` → #qtd(6.022e23, "mol^-1")

== Intervalos (`faixa-num`, `faixa-qtd`)

- `faixa-num(1, 5)` → #faixa-num(1, 5)
- `faixa-qtd(1, 5, "m")` → #faixa-qtd(1, 5, "m")
- `faixa-qtd(20, 25, "°C")` → #faixa-qtd(20, 25, "°C")
- `faixa-qtd(1, 5, "m", repetir-unidade: false)` → #faixa-qtd(1, 5, "m", repetir-unidade: false)

== Listas (`lista-num`, `lista-qtd`)

- `lista-num(1, 2, 3)` → #lista-num(1, 2, 3)
- `lista-num(10, 20, 30, 40)` → #lista-num(10, 20, 30, 40)
- `lista-qtd(1, 2, 3, u: "m")` → #lista-qtd(1, 2, 3, u: "m")
- `lista-qtd(100, 200, 300, u: "mL")` → #lista-qtd(100, 200, 300, u: "mL")
- `lista-qtd(1, 2, 3, u: "kg", repetir-unidade: false)` → #lista-qtd(1, 2, 3, u: "kg", repetir-unidade: false)

== Ângulos (`ang`)

- `ang(45.5)` → #ang(45.5)
- `ang(45, minutos: 30)` → #ang(45, minutos: 30)
- `ang(45, minutos: 30, segundos: 15)` → #ang(45, minutos: 30, segundos: 15)

== Tabela com `tablenum`

#table(
  columns: (auto, 6em, auto),
  align: (left, right, left),
  stroke: 0.5pt,
  inset: 5pt,
  [*Amostra*], [*Massa (g)*], [*Obs.*],
  [A], tablenum(3.14, casas: 2, largura: 100%), [ok],
  [B], tablenum(125.7, casas: 2, largura: 100%), [ok],
  [C], tablenum(0.98, casas: 2, largura: 100%), [ok],
  [D], tablenum(1024.5, casas: 2, largura: 100%), [ok],
)

== Unidade customizada (`declarar-unidade`)

#declarar-unidade("pH", nome: "pH", plural: "pH")

- `qtd(7.4, "pH")` → #qtd(7.4, "pH")

== Configuração global

#configurar-numeros(decimal: ".", milhar: ",")

- Após `configurar-numeros(decimal: ".", milhar: ",")`:
  - `num(1234.56)` → #num(1234.56) _(estilo americano: 1,234.56)_

#configurar-numeros(decimal: ",", milhar: "\u{2009}")

- Após restaurar padrão brasileiro:
  - `num(1234.56)` → #num(1234.56) _(1 234,56)_
