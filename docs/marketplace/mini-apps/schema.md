---
layout: nocompress
nav_order: 10
title: "Схема взаимодействия"
parent: "Мини-приложения"
grand_parent: "Маркетплейс"
date: 2024-02-01 00:00:00 +0300
---

# Описание работы мини-приложения

Как правило, мини-приложение состоит из двух основных компонентов - интерфейса приложения (frontend)
и серверной части (backend). Интерфейс приложения отвечает за взаимодействие с покупателем и интерфейсом
Инвойсбокс, а серверная часть приложения отвечает за передачу данных между мини-приложением, магазином
и системой Инвойсбокс.

Мини-приложение может быть инициализировано в двух основных режимах:
- В качестве формы основного заказа
- В качестве формы заказа дополнительной услуги

В случае, если мини-приложение инициализируется в маркетплейсе или приложении Инвойсбокс, оно представяет
из себя форму основного заказа. При инициализации, мини-приложение может получить от интерфейса Инвойсбокс
сведения о покупателе (имя, адрес эл. почты, номер телефона). С помощью интерфейса мини-приложения, покупатель
выбирает необходимые товары и услуги, оформляет покупку. Мини-приложение, в соответствии со своими внутренними
процессами, формирует заказ и через серверную часть передаёт в систему Инвойсбокс информацию о заказе, а в ответ
получает ссылку для переадресации покупателя на платёжную форму. Получив ссылку, мини-приложение передаёт её
родительскому окну для инициализации процесса оплаты заказа покупателем. После подтверждения оплаты заказа,
покупатель может быть возвращён в мини-приложение магазина для продолжения процесса оформления покупки.

В случае, если мини-приложение инициализируется на платёжной странице Инвойсбокс, оно представяет из
себя форму заказа дополнительной услуги. Отличием от основной формы заказа является то, что родительское окно
передаст мини-приложению идентификатор основного заказа. Оформленный заказ в мини-приложении будет добавлен
и в конечном счёте оплачен покупателем одним платежём.

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
1. Мини-приложение Магазина перенаправляет покупателя по полученной ссылке на платёжную страницу системы &laquo;Инвойсбокс&raquo;. В случае, если покупатель использует мобильное устройство с установленным приложением Инвойсбокс, открывается приложение для подтверждения оплаты заказа.
1. Покупатель подтверждает оплату заказа/оплачивает счёт.
1. Система &laquo;Инвойсбокс&raquo; оповещает Магазин об успешной оплате заказа
1. Система &laquo;Инвойсбокс&raquo; перенаправляет покупателя обратно на мини-приложение Магазина
1. Мини-приложение магазина отображает информацию об оплаченной услуге или товаре. Мини-приложение обменивается с родительским окном сообщениями (позитивые и негативные сценарии)

---

[Читать далее &raquo;](/docs/marketplace/mini-apps/){: .btn .btn-primary .mb-4 .mb-md-0 .mr-2 }
