---
title: "\U0001F4E6 Sistema de Controle de Entregas de Motoboy"

---

# 📦 Sistema de Controle de Entregas de Motoboy

## 📜 Regra de Negócio

**Objetivo**  
O sistema deve registrar pedidos a serem entregues por motoboys e controlar o status dessas entregas.  

---

### **Regras principais**
1. **Cadastro de Motoboys**  
   - Cada motoboy deve ter nome, telefone e placa da moto.  
   - A placa deve ser única no sistema.

2. **Cadastro de Clientes**  
   - O cliente deve ter nome, telefone e endereço completo.  

3. **Registro de Pedidos**  
   - Cada pedido deve estar vinculado a um cliente e conter descrição, valor e endereço de entrega.  
   - O pedido deve ter um motoboy responsável atribuído.

4. **Status da Entrega**  
   - O pedido deve ter status: "Aguardando Retirada", "Em Rota" ou "Entregue".  
   - O status pode ser alterado pelo motoboy.

5. **Controle de Pagamento**  
   - O sistema deve registrar se o pagamento foi feito antecipadamente ou na entrega.  
   - Em caso de pagamento na entrega, o motoboy deve confirmar o recebimento.  

---

## 📌 Lista de 10 Questões SQL

### 1️⃣  
Liste o **nome e telefone** de todos os clientes que possuem pedidos com status **"Em Rota"**.

---

### 2️⃣  
Exiba o **nome do motoboy** e a **placa da moto** de todos que realizaram mais de **5 entregas** no último mês.

---

### 3️⃣  
Mostre todos os **pedidos pendentes** (`status = 'Aguardando Retirada'`) com o **nome do cliente e valor do pedido**.

---

### 4️⃣  
Liste os motoboys que **não possuem nenhuma entrega atribuída**.

---

### 5️⃣  
Encontre o **pedido de maior valor** e exiba a **descrição, nome do cliente e nome do motoboy responsável**.

---

### 6️⃣  
Mostre todos os pedidos cujo pagamento foi feito **na entrega** e ainda **não foram entregues**.

---

### 7️⃣  
Atualize o status para **"Entregue"** de todos os pedidos que estão com status **"Em Rota"** há mais de **2 dias**.

---

### 8️⃣  
Aumente em **10%** o valor de todos os pedidos cujo valor atual seja **inferior a R$ 20,00**.

---

### 9️⃣  
Altere o motoboy responsável pelo pedido de **ID 15** para o motoboy **ID 3**.

---

### 🔟  
Remova todos os registros de pedidos que **não possuem cliente vinculado**.

---

### 1️⃣1️⃣  
Liste todos os motoboys e a **quantidade de pedidos** que cada um realizou.  
*(Inclua motoboys sem pedidos)*

---

### 1️⃣2️⃣  
Mostre todos os clientes e o **valor total gasto** em pedidos.  
*(Inclua clientes que ainda não fizeram pedidos)*

---

### 1️⃣3️⃣  
Exiba o **nome do motoboy** e o **maior valor de pedido** que ele já entregou.  

---

### 1️⃣4️⃣  
Liste todos os clientes que **nunca receberam pedidos do motoboy "Carlos Souza"**.  

---

### 1️⃣5️⃣  
Mostre todos os pedidos e, ao lado, o **nome do cliente** e o **nome do motoboy** responsável.  
*(Obrigatório uso de dois `LEFT JOIN`)*

---

### 1️⃣6️⃣  
Liste todos os motoboys e a **data do último pedido entregue** por cada um.  

---

### 1️⃣7️⃣  
Exiba todos os clientes que **já tiveram pedidos com pagamento na entrega**, mostrando também o **valor médio** desses pedidos.  

---

### 1️⃣8️⃣  
Liste todos os motoboys e o **total de pedidos que ainda estão "Em Rota"**.  

---

### 1️⃣9️⃣  
Exiba o **nome dos motoboys** que **não realizaram nenhum pedido** no último mês.  

---

### 2️⃣0️⃣  
Mostre todos os pedidos, o nome do cliente e o nome do motoboy, **incluindo pedidos sem motoboy atribuído**.  


