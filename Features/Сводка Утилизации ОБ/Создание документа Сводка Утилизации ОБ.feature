﻿#language: ru


Функционал: Создание документа Сводка Утилизации ОБ

Как Утилизация_ГСМ_МТС я хочу
Создание документа Сводка Утилизации ОБ 
чтобы заполнить сводку   


Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

	
Сценарий: Проверка наличия Настройки объекта утилизации
	И Я открываю основную форму списка справочника "НастройкиОбъектовУтилизации"
	Когда открылось окно 'Настройки объектов утилизации'
	И таблица "Список" содержит строки:
		| 'Наименование' |
		| 'База "Прайм" (ПК УОБ) КГКМ' |

Сценарий: Создание документа Сводка Утилизации ОБ
// Создание
* Открытие списка документов
	И В командном интерфейсе я выбираю 'Технология' 'Сводка утилизации отходов бурения'
	Тогда открылось окно 'Сводка утилизации отходов бурения'
* Создание документа
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Сводка утилизации отходов бурения (создание)'
* Заполнение шапки
	И в поле с именем 'Дата' я ввожу текст '09.02.2023  0:00:00'
	И я перехожу к следующему реквизиту
	И из выпадающего списка с именем "Скважина" я выбираю точное значение 'База "Прайм" (ПК УОБ) КГКМ'
	Тогда элемент формы с именем "НастройкаОбъектовУтилизации" стал равен 'База \"Прайм\" (ПК УОБ) КГКМ'
	Тогда элемент формы с именем "СкважинаСервисаБР" стал равен ''
			
* Заполнение шлама
	И я нажимаю на кнопку с именем 'ШламЗаполнитьЗавозы'
	И в таблице "Шлам" я активизирую поле с именем "ШламНоменклатура"
* Распледеление шлама
	И в таблице "Шлам" я активизирую поле с именем "ШламКуда"
	И в таблице 'Шлам' я выделяю все строки
	И я нажимаю на кнопку с именем 'ШламПринятьВыделенныеСтрокиВМерник'
	И в меню формы я выбираю 'БОШ 175м³ (БОШ)'

	И в таблице "Шлам1" я активизирую поле с именем "ШламОткуда1"
	И в таблице 'Шлам1' я выделяю все строки
	И я нажимаю на кнопку с именем 'ПринятьВыделенныеСтрокиВМерникправая'
	И в меню формы я выбираю 'ТДС 2 72м³ (Термодеструкция)'
* Проверка заполнения распределения шлама
	Тогда таблица "ИтогиПриемаШламаПоМерникам" стала равной:
		| 'Мерник'                                                            | 'Объем по ТТН, м³' | 'Объем факт, м³' |
		| 'Входной мерник №2 72м³ Термодеструкции База "Прайм" (ПК УОБ) КГКМ' | '44,000'           | '44,000'         |
		| 'Входной мерник БОШ 175м³ База "Прайм" (ПК УОБ) КГКМ'               | '135,000'          | '135,000'        |
	
	

	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение и закрытие документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Сводка утилизации отходов бурения (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$' |

