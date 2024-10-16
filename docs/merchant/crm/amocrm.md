---
layout: default
nav_order: 10
title: "amoCRM"
parent: "Модули для CRM"
grand_parent: "Приём платежей"
date: 2024-02-08 13:00:00 +0300
---

# Описание модуля amoCRM

![amoCRM](/assets/images/crm/amocrm.png){: .img-right}

Модуль amoCRM предоставляет простую возможность подключить вашу CRM систему к «Инвойсбокс» для оформления счетов
клиентам.

# Установка расширения Инвойсбокс из амоМаркета

Модуль находится во вкладке амоМаркет -> Счета и эквайринги -> Инвойсбокс

![amoCRM](/assets/images/crm/amocrm/1.jpg){: .img}

В настройках самого модуля необходимо указать апи-токен, id магазина и ключ. Все данные отправляются после заключения договора.
Тестовые данные для v3 версии АПИ": 
- Токен b37c4c689295904ed21eee5d9a48d42e
- Id магазина ffffffff-ffff-ffff-ffff-ffffffffffff
- Ключ FLdK5xjj285BM3YDDJDoE4xNwnP5HbCF

![amoCRM](/assets/images/crm/amocrm/2.jpg){: .img}

## Выставление счетов


2. Создаём новый контакт, который будет выступать в роли плательщика во вкладке "списки" -> "контакты"

![amoCRM](/assets/images/crm/amocrm/4.jpg){: .img}

**Обязательно нужно указать номер телефона и email. Без этих данных счёт на оплату не будет сформирован!**
<br>
**При добавлении компании ИНН является обязательным полем!**

![amoCRM](/assets/images/crm/amocrm/6.jpg){: .img}

3. После создаём счёт по вкладке "списки" -> "счета / покупки"

Необходимо указать:
- Цену
- Название
- Количество
- НДС. Допустимые значения: 0, 10%, 20%

![amoCRM](/assets/images/crm/amocrm/5.jpg){: .img}

4. Ссылка на оплату будет сформирована внутри счёта.

![amoCRM](/assets/images/crm/amocrm/7.jpg){: .img}

5. Сначала идёт переход на страницу Amocrm, а оттуда на платёжную страницу Инвойсбокс

![amoCRM](/assets/images/crm/amocrm/8.jpg){: .img}









