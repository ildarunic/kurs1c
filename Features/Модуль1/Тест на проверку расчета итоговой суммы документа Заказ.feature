﻿#language: ru

@tree

Функционал:  Тест на проверку расчета итоговой суммы документа Заказ

Как Менеджер я хочу
вводить цену и количество товаров
чтобы документ автоматически считал общую сумму

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий



Сценарий: Проверка наличия Услуги Доставка
	И я закрываю все окна клиентского приложения
	И Я открываю основную форму списка справочника "Товары"
	Когда открылось окно 'Товары'
	
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Доставка' |

Сценарий: Проверка расчетов в табличной части
* Открытие документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	Когда открылось окно 'Заказы товаров'
		И в таблице "Список" я перехожу к строке:
		| 'Дата'                | 'Номер'     |
		| '21.12.2020 23:29:22' | '000000020' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ * от * *'
* Изменяем табличную часть документа
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '50,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '200'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" поле с именем "ТоварыСумма" имеет значение '10 000,00'
* Вторая Строка ТЧ
	И в таблице "Товары" я перехожу к следующей строке
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '120'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" поле с именем "ТоварыСумма" имеет значение '12 000,00'
* Проверяем общее количество
	И у элемента с именем "ТоварыИтогКоличество" я жду значения "320" в течение 3 секунд
* Проверяем общую сумму
	И у элемента с именем "ТоварыИтогСумма" я жду значения "22 000" в течение 3 секунд
* Закрываем документ без сохранения
	И Я закрываю окно 'Заказ * от * *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button1'

Сценарий: Проверка недоступности количества для строк с Услугами
* Открытие документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	Когда открылось окно 'Заказы товаров'
		И в таблице "Список" я перехожу к строке:
		| 'Дата'                | 'Номер'     |
		| '21.12.2020 23:29:22' | '000000020' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ * от * *'
* Копируем строку
	И я выбираю пункт контекстного меню с именем 'ТоварыКонтекстноеМенюСкопировать' на элементе формы с именем "Товары"
//	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
* Выбираем услугу Доставка
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'

	Когда открылось окно 'Товары'
	И в таблице "Список" я перехожу к первой строке
	И я нажимаю сочетание клавиш "Alt+F"
	Тогда открылось окно 'Найти'
	И в поле с именем 'Pattern' я ввожу текст 'Доставка'
	И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно 'Товары'
	И в таблице "Список" я активизирую поле с именем "Наименование"
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
			
* Проверка доступности поля ТоварыКоличество
	Тогда открылось окно 'Заказ * от * *'

	// После копирования строки и замены товара на услугу в этом поле должно стать 1, но на форме показываются ""
	И в таблице "Товары" поле с именем "ТоварыКоличество" имеет значение '' 
	
	// Сам реквизит должен быть доступен
	И В таблице "Товары" поле с именем "ТоварыКоличество" доступно
	И В таблице "Товары" поле с именем "ТоварыКоличество" доступно не только для просмотра
	 
	// Пытаемся втаращить в поле какое-либо значение. На самом деле должно падать уже при активизации поля.
	Попытка
		И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5'
		И я запоминаю строку "Тест не пройден" в переменную "$ПроверкаТоварыКоличество$"
	Исключение
		И я запоминаю строку "ТестПройден" в переменную "$ПроверкаТоварыКоличество$"

	Если переменная "$ПроверкаТоварыКоличество$" имеет значение "ТестПройден" Тогда
		И я удаляю переменную '$ПроверкаТоварыКоличество$'			
	Иначе
		И я вызываю исключение "ТоварыКоличество доступно для редактирования"

* Закрываем документ без сохранения
	И Я закрываю окно 'Заказ * от * *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button1'



