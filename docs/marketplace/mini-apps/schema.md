---
layout: nocompress
nav_order: 10
title: "Схема взаимодействия"
parent: "Мини-приложения"
grand_parent: "Маркетплейс"
date: 2024-02-01 00:00:00 +0300
---

# Схема взаимодействия магазина, мини-приложения и маркетплейса Инвойсбокс

<div class="mermaid">
sequenceDiagram
    autonumber
    participant Покупатель
    participant Маркетплейс
    participant Инвойсбокс
    participant Магазин
    rect rgb(204, 245, 204)
      Покупатель->>Маркетплейс: Выбор магазина, услуги или товара
      Маркетплейс->>Магазин: Инициализация мини-приложения
      Покупатель->>Магазин: Оформление заказа
      Магазин->>Инвойсбокс: Создание заказа или обновление счёта
      Магазин->>Покупатель: Перенаправление на платёжную страницу Инвойсбокс
      Покупатель->>Инвойсбокс: Оплата счёта
      Инвойсбокс->>Магазин: Уведомление об успешной оплате заказа
      Инвойсбокс->>Магазин: Перенаправление покупателя на мини-приложение магазина
      Магазин->>Покупатель: Отображение информации об оплаченной услуге или товаре
    end
</div>

1. Покупатель производит поиск товара, услуги или точки продаж в Маркетплейсе Инвойсбокс или выбирает дополнительные услуги на платёжной странице
1. Маркетплейс или платёжная страница инициализируют [мини-приложение](/docs/marketplace/mini-apps/) Магазина и передают ему (опционально) идентификатор текущего заказа (счёта) покупателя
1. Покупатель, используя мини-приложение, активирует услугу, оформляет заказ или покупку. [Мини-приложение](/docs/marketplace/mini-apps/) обменивается с родительским окном сообщениями (позитивые и негативные сценарии)
1. Мини-приложение Магазина вызывает метод API для [создания заказа](/docs/merchant/order/create) или [обновления существующего](/docs/merchant/order/update) (переданного) заказа (счёта)
1. Если мини-приложение работает в качестве формы основного заказа, оно перенаправляет покупателя по полученной ссылке на платёжную страницу системы &laquo;Инвойсбокс&raquo;. В случае, если покупатель использует мобильное устройство с установленным приложением Инвойсбокс, открывается приложение для подтверждения оплаты заказа. Если мини-приложение работает в качестве формы дополнительного заказа, оно уведомляет родительское окно об успешном формировании заказа ([onDone](/docs/marketplace/mini-apps/miniapp-sdk/)) и передаёт ему управление.
1. Если мини-приложение работает в качестве формы основного заказа, покупатель подтверждает оплату заказа/оплачивает счёт.
1. Система &laquo;Инвойсбокс&raquo; оповещает Магазин об успешной оплате заказа
1. Если мини-приложение работает в качестве формы основного заказа, система &laquo;Инвойсбокс&raquo; перенаправляет покупателя обратно на мини-приложение Магазина
1. Если мини-приложение работает в качестве формы основного заказа, мини-приложение магазина отображает информацию об оплаченной услуге или товаре. Мини-приложение обменивается с родительским окном сообщениями (позитивые и негативные сценарии)

---

[Читать далее &raquo;](/docs/marketplace/mini-apps/frame/){: .btn .btn-primary .mb-4 .mb-md-0 .mr-2 }

