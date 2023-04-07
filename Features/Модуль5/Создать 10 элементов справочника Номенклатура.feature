﻿#language: ru
@дерево

Функционал: Создание 10 элементов справочника Номенклатура

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: _unic_0001 Создание 10 элементов справочника Номенклатура // Справочник.Items
* Подготовка
	И Я открываю навигационную ссылку "e1cib/list/Catalog.Items"
	И Я запоминаю в переменную "Счетчик" значение 0
* Цикл
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Счетчик$ + 1' в переменную "Счетчик"
		И Я запоминаю значение выражения '"Товар " + $Счетчик$' в переменную "ТоварНаименование"
		И Я запоминаю значение выражения '2002000 + $Счетчик$' в переменную "ТоварАртикул"
		И я проверяю или создаю для справочника "Items" объекты:
			| 'Ref'                                                                                            | 'DeletionMark' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID'         | 'Description_en'      |
			| '{"e1cib/data/Catalog.Items?ref=" + СтрЗаменить(Строка(Новый УникальныйИдентификатор), "-","")}' | 'False'        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | '$ТоварАртикул$' | '$ТоварНаименование$' |
