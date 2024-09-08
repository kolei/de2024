--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `orderid` int(11) NOT NULL,
  `datecreation` date NOT NULL,
  `orderstatus` varchar(50) NOT NULL,
  `nameconference` varchar(50) NOT NULL,
  `amountguests` int(11) NOT NULL,
  `equipment` varchar(50) NOT NULL,
  `paymentstatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`orderid`, `datecreation`, `orderstatus`, `nameconference`, `amountguests`, `equipment`, `paymentstatus`) VALUES
(1, '2023-06-10', 'готов', 'Конференция о здоровом образе жизни и фитнесе', 80, 'проектор', 'принят'),
(2, '2023-06-08', 'готовится', 'Конференция по развитию лидерских качеств и команд', 50, 'флипчарт', 'принят'),
(3, '2023-06-09', 'готов', 'Конференция по туризму и путешествиям: открытие но', 170, 'проектор, микрофоны, вкс', 'оплачен'),
(4, '2023-06-07', 'готов', 'Конференция успешного предпринимателя: секреты про', 35, 'флипчарт', 'оплачен'),
(5, '2023-06-06', 'готовится', 'Цифровая конференция: новые тренды и возможности', 300, 'проектор, микрофоны', 'принят');

-- --------------------------------------------------------

--
-- Структура таблицы `orderuserlist`
--

CREATE TABLE `orderuserlist` (
  `orderuserlistid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shift`
--

CREATE TABLE `shift` (
  `shiftid` int(11) NOT NULL,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `userroleid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`userid`, `login`, `password`, `status`, `lastname`, `firstname`, `middlename`, `userroleid`) VALUES
(1, 'rubies', 'cmjcFvB3cI', NULL, 'Селиванов', 'Николай', 'Даниилович', 2),
(2, 'windle', '2PAUAd0gMZ', NULL, 'Афанасьев', 'Никита', 'Львович', 1),
(3, 'improv', 'bcFFGU16f6', NULL, 'Кириллова', 'Мария', 'Львовна', 1),
(4, 'moving', 'A8HPZz9HTG', NULL, 'Савина', 'Анна', 'Серафимовна', 2),
(5, 'bellum', 'ZjXm3JW7RJ', NULL, 'Зайцева', 'Алиса', 'Адамовна', 3),
(6, 'siller', 'dVMfx1VMFF', NULL, 'Фадеев', 'Степан', 'Романович', 3),
(7, 'ragman', '25Y9oOkwHn', NULL, 'Яковлева', 'Ева', 'Максимовна', 2),
(8, 'fautor', 'RJ41C0qynP', NULL, 'Зиновьев', 'Станислав', 'Демидович', 3),
(9, 'coated', '8g2FubQVZH', NULL, 'Корнев', 'Андрей', 'Ильич', 2),
(10, 'fiches', 'LO1qRB42GP', NULL, 'Кондрашов', 'Иван', 'Даниилович', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `userlist`
--

CREATE TABLE `userlist` (
  `userlistid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `shiftid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `userrole`
--

CREATE TABLE `userrole` (
  `userroleid` int(11) NOT NULL,
  `namerole` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `userrole`
--

INSERT INTO `userrole` (`userroleid`, `namerole`) VALUES
(1, 'Заведующий подразделением'),
(2, 'Организатор'),
(3, 'Техник');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderid`);

--
-- Индексы таблицы `orderuserlist`
--
ALTER TABLE `orderuserlist`
  ADD PRIMARY KEY (`orderuserlistid`),
  ADD KEY `orderuserlist___fk` (`userid`),
  ADD KEY `orderuserlist___fk2` (`orderid`);

--
-- Индексы таблицы `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shiftid`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `user___fk` (`userroleid`);

--
-- Индексы таблицы `userlist`
--
ALTER TABLE `userlist`
  ADD PRIMARY KEY (`userlistid`),
  ADD KEY `userlist___fk` (`userid`),
  ADD KEY `userlist___fk2` (`shiftid`);

--
-- Индексы таблицы `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`userroleid`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `orderuserlist`
--
ALTER TABLE `orderuserlist`
  MODIFY `orderuserlistid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shift`
--
ALTER TABLE `shift`
  MODIFY `shiftid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `userlist`
--
ALTER TABLE `userlist`
  MODIFY `userlistid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `userrole`
--
ALTER TABLE `userrole`
  MODIFY `userroleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orderuserlist`
--
ALTER TABLE `orderuserlist`
  ADD CONSTRAINT `orderuserlist___fk` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `orderuserlist___fk2` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user___fk` FOREIGN KEY (`userroleid`) REFERENCES `userrole` (`userroleid`);

--
-- Ограничения внешнего ключа таблицы `userlist`
--
ALTER TABLE `userlist`
  ADD CONSTRAINT `userlist___fk` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `userlist___fk2` FOREIGN KEY (`shiftid`) REFERENCES `shift` (`shiftid`);
COMMIT;
