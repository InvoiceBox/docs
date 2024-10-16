---
layout: nocompress
nav_order: 20
title: "Банки, PSP и агрегаторы"
parent: "Партнёрское API"
permalink: docs/partner/payment-service-provider
date: 2023-11-21 00:00:00 +0300
---

## Банки, PSP и агрегаторы приёма платежей

Банки, PSP и агрегаторы, предоставляющие своим клиентам возможность принимать оплату от физических лиц, могут интегрировать
систему Инвойсбокс для приёма платежей от юридических лиц.

Схема интеграции схожа с подключением типового торгово-сервисного предприятия в эквайринге, она делится на два этапа:
1. Создание и получение доступа к магазину клиента в системе Инвойсбокс
2. Создание заказа и подтверждение оплаты

### Получение доступа к магазину клиента в системе Инвойсбокс

<div class="mermaid">
sequenceDiagram
    autonumber
    participant Магазин
    participant Партнёр
    participant Инвойсбокс
    rect rgb(204, 245, 204)
        Магазин->>Партнёр: Желание принимать платежи от юр. лиц
        Партнёр-->>Инвойсбокс: Заявка на подключение к Инвойсбокс
        Партнёр->>Инвойсбокс: Запрос на предоставление доступа к магазину
        Инвойсбокс->>Магазин: Запрос на предоставление доступа к магазину
        Магазин->>Инвойсбокс: Подтверждение запроса, разрешение доступа
        Инвойсбокс->>Партнёр: Предоставление доступа Партнёру к Магазину
    end
</div>

1. Магазин в системе партнёра выбирает услугу приёма платежей от юридических лиц через систему Инвойсбокс
1. Если магазин не зарегистрирован, Партнёр отправляет заявку на подключение в систему Инвойсбокс
1. Если магазин зарегистрирован, Партнёр отправляет запрос в систему Инвойсбокс на предоставление доступа к магазину
1. Система Инвойсбокс направляет магазину запрос на предоставление доступа
1. Магазин либо разрешает доступ (принимает запрос), либо отклоняет его
1. В случае, если магазин принял запрос, система Инвойсбокс предоставляет Партнёру доступ к магазину для создания в нём заказов и оформления счетов

### Создания заказа и подтверждение оплаты

<div class="mermaid">
sequenceDiagram
    autonumber
    participant Покупатель
    participant Магазин
    participant Партнёр
    participant Инвойсбокс 
    rect rgb(204, 245, 204)
        Покупатель->>Магазин: Создание заказа
        Магазин->>Партнёр: Создание заказа в системе Партнёра (с корзиной, для возможности оплаты юр. лицом)
        Партнёр->>Покупатель: Предоставление возможности выбора способа оплаты заказа (онлайн, QR, картой через pos-терминал, для юр.лиц)
        Покупатель->>Партнёр: Выбор способа оплаты для юр. лиц
        Партнёр->>Инвойсбокс: Создание заказа в системе Инвойсбокс
        Инвойсбокс-->>Покупатель: Уведомление в приложение "Счёт - бухгалтеру" о наличии нового счёта на оплату (если покупатель зарегистрирован)
        Инвойсбокс->>Партнёр: Передача ссылки на оплату
        Партнёр->>Покупатель: Передача ссылки на оплату (через каналы связи или в виде QR кода)
        Покупатель->>Инвойсбокс: Оперативное подтверждение оплаты счёта
        Инвойсбокс->>Партнёр: Уведомление об успешной оплате
        Инвойсбокс->>Магазин: Выплата принятых оплат магазину
        Партнёр->>Магазин: Уведомление об успешной оплате
        Партнёр->>Покупатель: Уведомление об успешной оплате
    end
</div>

