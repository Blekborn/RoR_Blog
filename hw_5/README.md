Дорабатываем наш блог.

0. Подключить пейджинацию для постов (отображать 8 постов для одной страницы). - `Done`
1. Автор (авторизированный пользователь) должен иметь возможность голосовать за каждый отдельный комментарий (+ / -). Реализовать можно через промежуточную таблицу AuthorCommentVote (author_id, comment_id, vote_value). https://guides.rubyonrails.org/association_basics.html - `Done`
2. Любой Посетитель сайта может видеть рейтинг комментария (сумму, а так же кол-во плюсов и минусов). - `Done`
3. Автор должен иметь возможность ответить комментарием на комментарий. Ограничить уровень вложенности комментариев до 5 уровней. Отформатировать вложенность. Смотрите аналогии на habr.ru, reddit.com (https://www.reddit.com/r/learnprogramming/comments/c9vtp2/learning_ruby_on_rails_anyone_else_what_resources/), ... 
Динамическое появление форм сделаем разберем на следующих занятиях.
Для вложенности использовать https://rubygems.org/gems/ancestry/ - `Done`

Ajax:
- использовать для создания (добавления) комментариев
- использовать для голосования (лайк/дизлайк)
- использовать для удаления комментариев

Разобраться в:
https://learn.jquery.com/
Уметь использовать селекторы, хайдить, аппендить, препендить элементы
Внимательно изучить и пройти: https://developers.google.com/web/tools/chrome-devtools


Гемы попробовать:
https://rubygems.org/gems/annotate/
https://github.com/deivid-rodriguez/byebug

Полезное:
   - настройка pg без пароля https://gist.github.com/p1nox/4953113
   - статья на form_with
   - https://medium.com/@eelan.tung/rails-forms-384cd22c65cc
   - https://m.patrikonrails.com/rails-5-1s-form-with-vs-old-form-helpers-3a5f72a8c78a
   - env credential https://medium.com/cedarcode/rails-5-2-credentials-9b3324851336
   - bynthtcysq ljrkfl gj gjdjle ckj;yjcntq fkujhbnvjd^ https://www.youtube.com/watch?v=kl7a1LWXjtI (Быстро по умолчанию: алгоритмическое мышление на практике. Владимир Агафонкин. JS Fest 2019 Spring)
