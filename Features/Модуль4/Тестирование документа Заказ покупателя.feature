﻿#language: ru

@tree

Функционал: Тестирование документа Заказ покупателя

Как МенеджерПоПродажам я хочу
протестировать корректность заполнения документа Заказ покупателя (реквизитов Партнер, Соглашение, блокировку поля Контрагент – в случае, если не выбран Партнер)
чтобы документ работал корректно  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _unic_0000 Загрузка данных в пустую базу
	// и экспорт основных данных
	

Сценарий: _unic_0001 Док.ЗаказПокупателя.ФормаДокумента Проверка заполнения реквизитов Партнер с одним Соглашением
* Тест партнера с одним соглашением - соглашение должно автоматически заполниться
	И я закрываю все окна клиентского приложения
	Когда В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            |
		| '1'   | 'Клиент 1 (1 соглашение)' |
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя (создание) *'
	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
	
* Проверка заполнения
	Тогда элемент формы с именем "Partner" стал равен 'Клиент 1 (1 соглашение)'
	И элемент формы с именем "LegalName" стал равен 'Клиент 1'
	И элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
	//И элемент формы с именем "Description" стал равен 'Нажмите для заполнения'
	//И элемент формы с именем "Status" стал равен 'Согласовано'
	И элемент формы с именем "Company" стал равен 'Собственная компания 1'
	И элемент формы с именем "Store" стал равен 'Склад 1 (с контролем остатка)'

* Тест партнера с двумя соглашениями - соглашение должно очиститься
	Когда открылось окно 'Заказ покупателя (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            |
		| '2'   | 'Клиент 2 (2 соглашения)' |
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя (создание) *'
	Тогда элемент формы с именем "Agreement" стал равен ''


Сценарий: _unic_0002 Док.ЗаказПокупателя.ФормаДокумента Проверка заполнения реквизитов Партнер с двумя Соглашениями
	
* Тест партнера с двумя соглашениями - соглашение в новом доке не должно заполняться
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            |
		| '2'   | 'Клиент 2 (2 соглашения)' |
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя (создание) *'
	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"

* Проверка заполнения
	Тогда элемент формы с именем "Partner" стал равен 'Клиент 2 (2 соглашения)'
	И элемент формы с именем "LegalName" стал равен 'Клиент 2'
	И элемент формы с именем "Agreement" стал равен ''
	И элемент формы с именем "Description" стал равен 'Нажмите для заполнения'
	//И элемент формы с именем "Status" стал равен 'Согласовано'
	И элемент формы с именем "Company" стал равен ''
	И элемент формы с именем "Store" стал равен ''


* Проверка заполнения Соглашения	
	Когда открылось окно 'Заказ покупателя (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Agreement"
	Тогда открылось окно 'Соглашения'
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'                                        |
		| '2'   | 'Индивидуальное соглашение 1 (расчет по соглашениям)' |
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя (создание) *'

* Проверка заполнения
	Тогда элемент формы с именем "Company" стал равен 'Собственная компания 1'
	И элемент формы с именем "Store" стал равен 'Склад 1 (с контролем остатка)'
	

Сценарий: _unic_0003 Док.ЗаказПокупателя.ФормаДокумента Проверка блокировки реквизита Контрагент если Партнер не выбран
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
	Когда элемент формы с именем "Partner" стал равен ''
	Тогда элемент формы "Контрагент" не доступен
	И я закрываю все окна клиентского приложения

