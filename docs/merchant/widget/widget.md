---
layout: default
nav_order: 70
title: "Платёжные виджеты на сайт"
parent: "Приём платежей"
permalink: docs/merchant/widget
date: 2023-10-28 00:00:00 +0300
---

# Платёжные виджеты на сайт

Платёжные виджеты - наиболее простой способ организации приёма платежей на вашем сайте. Он не требует
значительных знаний веб-технологий или настройки CMS. Всё что нужно - заранее заполнить сведения о
продаваемых товарах и услугах, скопировать получившийся код и вставить на ваш сайт. Виджеты могут
быть использованы на любых сайтах.

Основное преимущество размещения виджета - возможность добиться максимального количества импульсивных
покупок.

### Подготовительная работа

Для лучшего пользовательского опыта, рекомендуем вам подготовить страницы на сайте - страница оплаты и
страница завершения оплаты.

**Страница оплаты** — страница на вашем сайте, на которой вы отобразите виджет, а пользователь введёт
свои данные для оплаты.

**Страница завершения оплаты** — страница на вашем сайте, на которую виджет перенаправит пользователя
после платежа и в случае успеха, и в случае неудачи. Ссылка (URL) этой страницы необходимо указать в
настройках виджета (см. ниже).

{: .important }
> Вы можете использовать любую страницу, например, главную вашего сайта. Мы рекомендуем сформировать
отдельную страницу, где вы опишите дальнейшие шаги пользователя, которые необходимы для получения услуги
или товара.

### Конструктор виджета и его настройки

Для того, чтобы получить код виджета для его размещения на вашем сайте, воспользуйтесь специальным
[конструктором](https://widget.invoicebox.ru/?utm_source=docs). Конструктор позволяет простыми действиями
произвести детальную настройку виджета под ваши нужды.

Для начала работы, укажите Идентификатор магазина и Региональный код магазина. Указанные параметры
вы сможете найти в письме, которое было направлено вам по факту регистрации в системе «Инвойсбокс».

![FormConstructor](/assets/images/widget/formconstructor.png){: .img }

Далее, рассмотрим параметры конструктора по отдельности:

**Тип оплаты**

- Оплата товара(ов) или услуг(и) — Определяет возможность заранее указать сумму к оплате. Плательщик
не будет иметь возможности ввести сумму к оплате в свободной форме. Вариант подойдет для Интернет-магазинов, которые
продают товары или набор услуг с определённой стоимостью;
- Пополнение баланса/платёж со свободной суммой — Определяет возможность указать сумму к оплате самим плательщиком.
Вариант подойдёт для он-лайн сервисов, Интернет-провайдеров или иных провайдеров услуг, где необходима реализация
пополнения лицевого счёта клиента. Клиент самостоятельно укажет необходимую сумму к оплате.

**Текст на кнопке**

Определяет текст, отображаемый на кнопке виджета. Набор текстов может быть расширен по запросу в
[службу поддержки](https://www.invoicebox.ru/ru/contacts/feedback.html).

**Дополнительные поля**

Набор дополнительных сведений, которые необходимо будет указать плательщику. Виджет проверит корректность
заполнения дополнительных сведений и не позволит произвести платёж, в случае ошибки.

- Номер заказа — любая строка, не более 250 символов;
- Фамилия, Имя плательщика — фамилия и имя плательщика вместе, разделенные хотя бы одним пробелом;
- Номер мобильного телефона — набор цифр, не менее 10;
- Адрес эл. почты — корректный адрес эл. почты;
- Количество услуг/товаров — число больше 1. Отмечается, если вы хотите позволить плательщику указать количество оплачиваемых товаров или услуг.

Обратите внимание, плательщику в обязательном порядке необходимо указать как минимум один из следующих параметров —
Адрес электронной почты или Номер мобильного телефона.

**Тип плательщика**

По-умолчанию, счёт формируется для оплаты физическим лицом. Если вы хотите формировать счета для организаций или ИП,
вы можете задать такую опцию в поле Тип плательщика. Вы также можете выбрать опцию, при которой плательщик сам будет
выбирать способ оплаты.

**Наименование оплаты**

Опция будет доступна в случае, если номер заказа требуется заполнить плательщиком. Определяет наименование назначения платежа.

**Код товара или услуги**

Уникальный идентификатор заказа, договора, товара, артикула и т.д. Любой набор символов от 1 до 16. Данный параметр является
обязательным к заполнению.

**Ссылка возврата**

Укажите ссылку (URL) страницы завершения оплаты. Вы можете указать адрес любой страницы вашего сайта, на которую следует
переадресовать плательщика по завершению процедуры оплаты.

**Оплачиваемые товары или услуги**

Вам необходимо указать как минимум одну оплачиваемую позицию, количество (если не указывается плательщиком), а также цену.

**Выбор определённой позиции**

Опция будет доступна для использования, если количество товаров или услуг указано в количестве более 1 шт. Опция дает возможность
плательщику выбрать только одну из перечисленных позиций. Например, вы можете указать перечень тарифов для оплаты и позволить
плательщику выбрать один из тарифов.


### Размещение виджета

После того, как вы указали необходимые опции виджета, ниже в конструкторе, убедитесь в том, что она функционирует
корректно и в соответствии с произведёнными настройками. В случае, если вы хотите, чтобы плательщик оставался в том же
окне браузера, снимите отметку у опции «Открывать в новом окне».

Выделите сформированный код виджета и вставьте его на страницу вашего сайта.

{: .important }
> В случае, если у вас возникнут сложности при самостоятельной настройке виджета,
пожалуйста, обратитесь к специалистам [службы поддержки](https://www.invoicebox.ru/ru/contacts/feedback.html).


### Примеры реализации виджетов

**Простейший вариант виджета**

{::options parse_block_html="true" /}
<div id="InvoiceboxWidgetDiv-2304191633515" data-version="20230419"></div><script type="text/javascript"> var s = document.createElement("script"); s.setAttribute("type", "text/javascript" ); s.setAttribute("src", "https://widget.invoicebox.ru/js/widget/widget.min.js?_=" + Math.floor(Math.random() * 100000000) ); s.onload = function() { InvoiceBoxWidget2304191633515 = {}; InvoiceBoxWidget(InvoiceBoxWidget2304191633515); InvoiceBoxWidget2304191633515.init({ "widget_id" : "2304191633515", "widget_version" : "3", "widget_button_type" : "1", "widget_order_type" : "1", "widget_payment_type" : "1", "widget_addfields" : "participant_order_id,person_email", "widget_goods" : "eNqLrlYqqSxIVbJSKk4tKstMTlXSUcpLzAUJXJh4YceF3Re2XmxSuLD3wgaFiy0X9l1suNh8YQ9QTW5qYnFpEUjZxY6LTUCBwtLEvJLMkkqgiCGQW1AEMstKydTAAMgrSywBso2VamMBs2ssjg==", "widget_person_type" : "1", "widget_target_blank" : "1", "itransfer_language_id" : "1", "itransfer_participant_id" : "131", "itransfer_order_id" : "", "itransfer_participant_ident" : "78043", "itransfer_url_return" : "123", }, 600, "auto", "InvoiceboxWidgetDiv-2304191633515"); }; (document.getElementsByTagName("head")[0] || document.documentElement).appendChild(s);</script>
{::options parse_block_html="false" /}

**Виджет с количеством товара**

{::options parse_block_html="true" /}
<div id="InvoiceboxWidgetDiv-2304191648438" data-version="20230419"></div><script type="text/javascript"> var s = document.createElement("script"); s.setAttribute("type", "text/javascript" ); s.setAttribute("src", "https://widget.invoicebox.ru/js/widget/widget.min.js?_=" + Math.floor(Math.random() * 100000000) ); s.onload = function() { InvoiceBoxWidget2304191648438 = {}; InvoiceBoxWidget(InvoiceBoxWidget2304191648438); InvoiceBoxWidget2304191648438.init({ "widget_id" : "2304191648438", "widget_version" : "3", "widget_button_type" : "1", "widget_order_type" : "1", "widget_payment_type" : "1", "widget_addfields" : "participant_order_id,quantity,person_email", "widget_goods" : "eNqLrlYqqSxIVbJSKk4tKstMTlXSUcpLzAUJXJh4YceF3Re2XmxSuLD3wgaFiy0X9l1suNh8YQ9QTW5qYnFpEUjZxY6LTUCBwtLEvJLMkkolq7zSnBwdpYIikGFWSqYGBkDZssQSINtYqTYWAP01LdQ=", "widget_person_type" : "1", "widget_target_blank" : "1", "itransfer_language_id" : "1", "itransfer_participant_id" : "131", "itransfer_order_id" : "", "itransfer_participant_ident" : "78043", "itransfer_url_return" : "123", }, 600, "auto", "InvoiceboxWidgetDiv-2304191648438"); }; (document.getElementsByTagName("head")[0] || document.documentElement).appendChild(s);</script>
{::options parse_block_html="false" /}

**Виджет с выбором товара**

{::options parse_block_html="true" /}
<div id="InvoiceboxWidgetDiv-2304191652341" data-version="20230419"></div><script type="text/javascript"> var s = document.createElement("script"); s.setAttribute("type", "text/javascript" ); s.setAttribute("src", "https://widget.invoicebox.ru/js/widget/widget.min.js?_=" + Math.floor(Math.random() * 100000000) ); s.onload = function() { InvoiceBoxWidget2304191652341 = {}; InvoiceBoxWidget(InvoiceBoxWidget2304191652341); InvoiceBoxWidget2304191652341.init({ "widget_id" : "2304191652341", "widget_version" : "3", "widget_button_type" : "1", "widget_order_type" : "1", "widget_payment_type" : "1", "widget_addfields" : "quantity,person_email", "widget_goods" : "eNqLrlYqqSxIVbJSKk4tKstMTlXSUcpLzAUJXJh4YceF3Re2XmxSuLD3wgaFiy0X9l1suNh8YY/ChX0XNl7svth+Ye/F7gs7gVpyUxOLS4tAui52XGwCChSWJuaVZJZUKlnllebk6CgVFIHMtlIy0DMwAEqXJZYAOcZKtTpk2R/mGaBwYfuFDRd2U2J3LABGTmuD", "widget_person_type" : "1", "widget_goods_select" : "1", "widget_target_blank" : "1", "itransfer_language_id" : "1", "itransfer_participant_id" : "131", "itransfer_order_id" : "123", "itransfer_participant_ident" : "78043", }, 600, "auto", "InvoiceboxWidgetDiv-2304191652341"); }; (document.getElementsByTagName("head")[0] || document.documentElement).appendChild(s);</script>
{::options parse_block_html="false" /}

**Виджет пополнения баланса**

{::options parse_block_html="true" /}
<div id="InvoiceboxWidgetDiv-2304191654150" data-version="20230419"></div><script type="text/javascript"> var s = document.createElement("script"); s.setAttribute("type", "text/javascript" ); s.setAttribute("src", "https://widget.invoicebox.ru/js/widget/widget.min.js?_=" + Math.floor(Math.random() * 100000000) ); s.onload = function() { InvoiceBoxWidget2304191654150 = {}; InvoiceBoxWidget(InvoiceBoxWidget2304191654150); InvoiceBoxWidget2304191654150.init({ "widget_id" : "2304191654150", "widget_version" : "3", "widget_button_type" : "3", "widget_order_type" : "1", "widget_payment_type" : "2", "widget_addfields" : "person_email", "widget_goods" : "eNqLrlYqqSxIVbJSKk4tKstMTlXSUcpLzAUJXJh/Yd+F/UC8+8LeC1uBeMeFrQoXNl7YABTYcGHvxcYLGxQubFIA0jsuNl5sAirZc2ErUHtuamJxaRHIhIsdF5uAAoWliXklmSWVQBFDILegCGSNVV5pTo6OUlliCVDYWKk2FgAsY0F2", "widget_person_type" : "1", "widget_target_blank" : "1", "itransfer_language_id" : "1", "itransfer_participant_id" : "131", "itransfer_order_id" : "123", "itransfer_participant_ident" : "78043", }, 600, "auto", "InvoiceboxWidgetDiv-2304191654150"); }; (document.getElementsByTagName("head")[0] || document.documentElement).appendChild(s);</script>
{::options parse_block_html="false" /}
 
---

[Настроить свой виджет &raquo;](https://widget.invoicebox.ru/?utm_source=docs){: .btn .btn-primary .mb-4 .mb-md-0 .mr-2 } [Читать далее &raquo;](/docs/merchant/cms){: .btn .mb-4 .mb-md-0 }
