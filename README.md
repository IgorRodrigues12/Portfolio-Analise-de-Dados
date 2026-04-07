# Análise de Vendas com SQL e Power BI

![Dashboard](Power%20bi/Dashboard_preview.JPG)

Projeto de portfólio desenvolvido com foco em análise de dados, utilizando SQL Server para modelagem e consulta dos dados, e Power BI para construção de dashboard interativo com KPIs e visualizações de negócio.

---

## Objetivo

Simular um cenário real de análise de vendas, explorando indicadores importantes para tomada de decisão, como:

- Receita total
- Quantidade de vendas
- Ticket médio
- Crescimento de vendas
- Produtos mais vendidos
- Clientes com maior faturamento
- Receita por período

---

## Ferramentas utilizadas

- SQL Server
- Power BI
- GitHub

---

## Estrutura do projeto

---

## Modelagem de Dados

O projeto foi construído com base em 3 tabelas principais:

- **Clientes**
- **Produtos**
- **Vendas**

A tabela `Vendas` faz a ligação entre clientes e produtos, permitindo análises relacionais.

### Regras de relacionamento:
- Um cliente pode realizar várias compras
- Um produto pode aparecer em várias vendas
- Cada venda possui data, quantidade e receita

---

## Consultas SQL desenvolvidas

Durante o projeto, foram criadas consultas para responder perguntas de negócio, como:

- Mostrar todas as vendas com nome do produto
- Mostrar cliente e produto comprados
- Mostrar total de vendas por cliente
- Mostrar quantidade de vendas por produto
- Mostrar receita total por cliente
- Mostrar receita total por categoria
- Mostrar produto mais vendido
- Mostrar cliente que mais comprou
- Mostrar média de valor das vendas
- Mostrar top 3 clientes que mais compraram
- Mostrar receita por mês
- Mostrar produto mais vendido em cada categoria
- Mostrar clientes que nunca compraram
- Mostrar ranking de clientes por receita

---

## Exemplo de consulta SQL

### Receita total por cliente
```sql
SELECT c.nome_cliente, SUM(v.receita) AS receita_total
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.nome_cliente;

```

##Dashboard no Power BI

O dashboard foi desenvolvido para apresentar os principais indicadores de vendas de forma visual e intuitiva.

KPIs principais:
Receita Total
Quantidade Total de Vendas
Ticket Médio
Crescimento Mensal (%)


--Visuais utilizados

Cards de indicadores
Gráfico de linha para evolução mensal
Gráfico de barras para produtos mais vendidos
Análise por cliente
Segmentações por período, cliente e produto

---Insights encontrados

Clientes com maior volume de compras representam a maior parte da receita
Alguns produtos possuem alta recorrência de vendas
Existe variação de receita ao longo dos meses
Determinadas categorias apresentam maior faturamento

---Habilidades demonstradas

SQL para análise de dados (JOIN, GROUP BY, agregações)
Modelagem de banco de dados relacional
Power BI para construção de dashboards e KPIs
Pensamento analítico voltado a negócio
Organização de projeto em GitHub

---Próximos passos

Implementar margem de lucro
Aplicar DAX mais avançado
Adicionar análise por região e segmento


Autor

Igor Rodrigues da Mata
📍 Sorocaba - SP
🔗 https://linkedin.com/in/igorrodriguesdamata

