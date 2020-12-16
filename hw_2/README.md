Нужно сгенерировать рельсовый проект и сгенерировать сущность Posts используя скафолд.
Установить бутстрап гем, использовать его для вьюх (добавить вёрстку во вьюхах).

Шаги:
1) Настроить RubyMine (или удобный для вас редактор) - `Done`
2) Установить RoR 6.1 (gem install rails) - `Done`
3) Убедиться что установлена нужная версия рельс (rails -v) - `Done`
4) Сгенерировать рельсовый проект (rails new project_name) - `Done`
5) Сгенерировать сущности Post используя скафолд и затем прогнать миграцию - `Done`
     - rails generate scaffold Post name:string title:string content:text image:string
     - rake db:migrate
6) Запустить проект (убедиться что всё работает) - `Done`
7) Установить бутстрап - `Done`
8) Применить вёрстку используя бутстрап - `Done`
9) Использовать обязательно RVM или rbenv - `Done`
10) Настроить свою IDE или Text Editor согласно Ruby style code (два пробела, а не таб и т.д.) - `Done`
11) сделать страницу постов (index) корневой страницей проекта - `Done`
12) добавить валидацию (проверку наличия данных, максимального размера для title) полей поста (title, description) - `Done`
13) создать модель Author (только модель (rails g model), таблица будет заполняться с помощью seed, создать 5 авторов) - `Done`
14) Поля автора: first_name, last_name, gender, birthday (сгенерировать данные с помощью гема faker, тип полей в соответсвии с назначением (string, datetime)) - `Done`
15) при создании или редактировании поста - автора мы должны выбирать с помощью выпадающего списка. - `Done`
16) Поле image – url. Выводить на странице поста между title и description через хелпер/метод image_tag. - `Done`
17) Залить на Хероку. - `Done`

_____________
Литература:
https://rubygems.org/gems/rails
https://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html
https://guides.rubyonrails.org/command_line.html
https://www.jetbrains.com/help/ruby/ruby-gemsets.html
https://getbootstrap.com/docs/4.3/getting-started/download/#rubygems
https://github.com/twbs/bootstrap-rubygem/blob/master/README.md
https://guides.rubyonrails.org/action_view_overview.html
https://guides.rubyonrails.org/layouts_and_rendering.html

Дополнительная литература
https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller
https://guides.rubyonrails.org/routing.html
https://guides.rubyonrails.org/active_record_validations.html

Дополнительные ссылки
https://mattbrictson.com/sublime-text-3-recommendations - хорошая статья по настройке Sublime Text 3
https://www.marksayson.com/blog/setting-up-sublime-text-editor-for-ruby-on-rails/ - еще одна