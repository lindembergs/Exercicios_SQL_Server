---
title: "\U0001F4D8 Exercício de Comandos DML"

---

# 📘 Exercício de Comandos DML  
## 🏨 Tema: Sistema de Hotelaria  
### 💯 Nota máxima: 10 pontos

---

## 🗂️ Estrutura do Banco de Dados

### 📄 Tabela: `Hospede`

- `Id`: INT, chave primária, auto incremento  
- `Nome`: VARCHAR(100), obrigatório  
- `CPF`: VARCHAR(14), único  
- `Email`: VARCHAR(100)  
- `DataNascimento`: DATE  

---

### 📄 Tabela: `Reserva`

- `Id`: INT, chave primária, auto incremento  
- `IdHospede`: INT – chave estrangeira para `Hospede(Id)`  
- `DataCheckin`: DATE  
- `DataCheckout`: DATE  
- `IdQuarto`: INT – chave estrangeira para `Quarto(Id)`  

---

### 📄 Tabela: `Quarto`

- `Id`: INT, chave primária, auto incremento  
- `Numero`: VARCHAR(10), obrigatório  
- `Tipo`: VARCHAR(50) — Ex: "Simples", "Luxo", "Suíte"  
- `PrecoDiaria`: DECIMAL(7,2)  

---

### 📄 Tabela: `Pagamento`

- `Id`: INT, chave primária, auto incremento  
- `IdReserva`: INT – chave estrangeira para `Reserva(Id)`  
- `DataPagamento`: DATE  
- `Valor`: DECIMAL(8,2)  
- `FormaPagamento`: VARCHAR(50) — Ex: "Cartão", "Pix", "Dinheiro"  

---

### 📄 Tabela: `ServicoExtra`

- `Id`: INT, chave primária, auto incremento  
- `Descricao`: VARCHAR(100)  
- `Valor`: DECIMAL(7,2)  

---

### 📄 Tabela: `ReservaServico`

- `IdReserva`: INT – chave primária/chave estrangeira para `Reserva(Id)`  
- `IdServicoExtra`: INT – chave primária/chave estrangeira para  `ServicoExtra(Id)`  

---

## 📝 Questões DML

> 💡 Responda as questões de acordo com o conhecimento adquirido.

---

### 1️⃣   
Liste o nome dos hóspedes e a quantidade de reservas realizadas por cada um.

---

### 2️⃣  
Exiba os quartos que já foram reservados por mais de um hóspede diferente.

---

### 3️⃣  
Liste as reservas que não possuem nenhum pagamento registrado.

---

### 4️⃣  
Exiba o total pago por cada reserva, somando o valor do pagamento e dos serviços extras utilizados.

---

### 5️⃣  
Atualize a forma de pagamento da reserva do hóspede **"Fernanda Souza"** para **"Pix"**, considerando a reserva mais recente.

---

### 6️⃣  
Liste o nome dos hóspedes que já utilizaram três ou mais tipos diferentes de serviços extras.

---

### 7️⃣  
Remova todas as reservas com data de check-out anterior a **1º de janeiro de 2020**.

---

### 8️⃣ 
Liste todos os serviços extras utilizados em reservas no quarto número **"202"**.

---

### 9️⃣  
Mostre os hóspedes que usaram o serviço **"Massagem Relaxante"** ao menos uma vez.

---

### 🔟 
Altere o tipo de todos os quartos com diária superior a **R$ 800,00** para **"Executivo"**.

---

### 1️⃣1️⃣
Para cada quarto que já foi reservado, exiba o número do quarto, o tipo, o nome do hóspede e a data de check-in..

---

### 1️⃣2️⃣
Exiba os **5 hóspedes mais recentes** (com base na data da última reserva).

---

### 1️⃣3️⃣
Mostre todos os pagamentos realizados, exibindo: nome do hóspede, número do quarto, valor do pagamento e forma de pagamento..

---

### 1️⃣4️⃣
Exiba a **média de dias de estadia por tipo de quarto**.

---

### 1️⃣5️⃣
Liste os hóspedes que **possuem e-mail com domínio "@gmail.com"** e que já realizaram ao menos uma reserva.

---
