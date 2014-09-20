" ~/.vim/sessions/default.vim:
" Vim session script.
" Created by session.vim 2.6.4 on 20 September 2014 at 11:42:57.
" Open this file in Vim and run :source % to restore your session.

set guioptions=aegimrLtT
silent! set guifont=
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'neon' | colorscheme neon | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Documents/Rails\ Stuff/grading_app
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +227 app/models/course.rb
badd +1 app/models/submission.rb
badd +87 app/models/assignment.rb
badd +2 app/models/subpart.rb
badd +6 app/models/enrollment.rb
badd +8 app/models/user.rb
badd +1 db/migrate/20140829111025_create_subparts.rb
badd +1 db/migrate/20140706015611_create_assignments.rb
badd +3 db/migrate/20140706154427_add_pdf_to_assignments.rb
badd +3 db/migrate/20140712124449_add_attributes_to_assignments.rb
badd +32 temp.rb
badd +64 app/controllers/submissions_controller.rb
badd +92 config/routes.rb
badd +1 app/controllers/subparts_controller.rb
badd +52 app/controllers/assignments_controller.rb
badd +19 ~/.vim/.vimrc
badd +59 app/views/assignments/_form.html.erb
badd +13 app/views/assignments/show.html.erb
badd +1 app/views/courses/show.html.erb
badd +1 app/views/gradings/_gradings_list.html.erb
badd +7 app/views/assignments/_subpart_fields.html.erb
badd +2 app/views/gradings/show.html.erb
badd +1 app/assets/javascripts/assignments.js.coffee
badd +15 app/views/assignments/_assignments_list.html.erb
badd +51 app/helpers/application_helper.rb
badd +5 app/views/assignments/new.html.erb
badd +27 Gemfile
badd +1 ~/Documents/Rails\ Stuff/sample_app/app/controllers/relationships_controller.rb
badd +8 ~/Documents/Rails\ Stuff/sample_app/app/views/users/_follow_form.html.erb
badd +2 ~/Documents/Rails\ Stuff/sample_app/app/views/relationships/create.js.erb
badd +14 app/assets/stylesheets/application.css
badd +20 app/assets/javascripts/application.js
badd +8 config/locales/en.bootstrap.yml
badd +1 app/assets/stylesheets/bootstrap_and_overrides.css
badd +129 app/assets/stylesheets/bootstrap_and_overrides.css.less
badd +1 app/views/layouts/application.html.erb
badd +5 app/views/assignments/edit.html.erb
badd +4 app/assets/javascripts/assignments.js.coffee.erb
badd +3 app/assets/javascripts/assignments.js.erb
badd +1 app/views/assignments/assignments.js.erb
badd +1 public/javascripts/nested_form.js
badd +1 app/views/assignments/configure_subparts.html.erb
badd +8 app/views/assignments/_subparts_config_form.html.erb
badd +28 app/views/assignments/_subpart_config_form.html.erb
badd +4 app/views/submissions/show.html.erb
badd +1 app/views/submissions/new.html.erb
badd +1 db/migrate/20140901115546_create_pages_and_join_to_subparts.rb
badd +1 db/migrate/20140710222636_add_pdf_to_submissions.rb
badd +7 app/models/page.rb
badd +51 app/uploaders/img_uploader.rb
badd +3 app/uploaders/pdf_uploader.rb
badd +6 app/models/pages_subparts_relationship.rb
badd +1 app/views/assignments/configure_grading.html.erb
badd +15 app/models/grading.rb
badd +1 app/models/grade.rb
badd +14 app/controllers/gradings_controller.rb
badd +1 db/migrate/20140904204742_add_subpart_id_to_gradings_and_grades.rb
badd +2 db/migrate/20140718185722_add_indices_to_assignment_grading_statuses.rb
badd +1 db/migrate/20140718184907_add_grading_score_to_enrollments.rb
badd +1 app/views/submissions/configure_subparts.html.erb
badd +4 app/views/submissions/_subparts_config_form.html.erb
badd +14 app/views/submissions/_subpart_config_form.html.erb
badd +1 app/assets/javascripts/submissions.js.coffee
badd +24 app/views/assignments/_grading_configs_form.html.erb
badd +11 db/migrate/20140712150704_create_gradings.rb
badd +8 db/migrate/20140718223842_create_grades.rb
badd +7 db/migrate/20140905221336_change_indices_on_gradings_and_grades.rb
badd +45 app/views/layouts/_header.html.erb
badd +1 app/assets/javascripts/gradings.js.coffee
badd +46 vendor/assets/javascripts/ddpowerzoomer.js
badd +80 lib/tasks/sample_data.rake
badd +24 TODO.md
badd +98 app/controllers/courses_controller.rb
badd +23 app/views/courses/roster.html.erb
badd +64 app/controllers/users_controller.rb
badd +58 app/controllers/enrollments_controller.rb
badd +5 app/views/courses/new_enrollment.html.erb
badd +1 app/views/courses/_add_students.html.erb
badd +13 app/views/courses/_form.html.erb
badd +7 app/views/enrollments/new.html.erb
badd +1 app/views/enrollments/_form.html.erb
badd +1 app/views/enrollments/edit
badd +5 app/views/enrollments/edit.html.erb
badd +1 app/views/enrollments/_search_bar.html.erb
badd +27 app/views/enrollments/index.html.erb
badd +5 app/views/enrollments/show.html.erb
badd +1 app/models/statuses.rb
badd +1 app/views/enrollments/_enrollment_view.html.erb
badd +4 app/views/static_pages/home.html.erb
badd +1 app/views/static_pages/_signed_in_homepage.erb.html
badd +1 app/views/static_pages/_not_signed_in_homepage.erb
badd +4 config/initializers/mime_types.rb
badd +1 ~/temp/name_4_data.txt
badd +1 temp.py
badd +1 asdf.rb
badd +1 asdf.py
badd +10 app/views/courses/data.html.erb
badd +55 app/views/courses/new_import.html.erb
badd +23 app/views/courses/example.rb
badd +1 app/views/courses/example.py
badd +1 entropy.m
badd +18 ~/Dropbox/Personal\ Research/Markov\ Chain\ Entropy/entropy.m
badd +6 app/views/courses/api.html.erb
badd +24 app/views/courses/api_course_yaml_file_example.py
badd +13 app/views/courses/api_course_with_subparts_yaml_file_example.rb
badd +2 app/views/courses/_yaml_form.html.erb
badd +148 app/views/courses/api_example1.py
badd +85 app/views/courses/api_example2.rb
badd +18 app/controllers/sessions_controller.rb
badd +28 ~/temp/asdf.py
badd +1 ~/temp/FILE_TO_UPLOAD.yaml
badd +5 ~/Documents/Rails\ Stuff/curl_testing/make_assignment.sh
badd +9 app/helpers/sessions_helper.rb
badd +1 app/views/layouts/_flash.html.erb
badd +144 ~/.bashrc
badd +2 app/views/shared/_error_messages.html.erb
badd +2 app/helpers/courses_helper.rb
args app/models/course.rb
edit app/controllers/courses_controller.rb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
9,11fold
13,21fold
23,30fold
32,33fold
35,38fold
40,42fold
44,59fold
61,62fold
64,72fold
74,79fold
81,82fold
84,125fold
127,143fold
let s:l = 84 - ((72 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
84
normal! 0
lcd ~/Documents/Rails\ Stuff/grading_app
tabedit ~/Documents/Rails\ Stuff/grading_app/app/helpers/application_helper.rb
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 20 + 20) / 41)
exe '2resize ' . ((&lines * 17 + 20) / 41)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 51 - ((0 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
51
normal! 0
lcd ~/Documents/Rails\ Stuff/grading_app
wincmd w
argglobal
edit ~/Documents/Rails\ Stuff/grading_app/app/models/course.rb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
17,89fold
91,117fold
134,143fold
125,149fold
159,178fold
179,195fold
152,198fold
119,201fold
209,242fold
203,248fold
250,276fold
278,294fold
296,310fold
119
silent! normal! zo
125
silent! normal! zo
125
normal! zc
152
silent! normal! zo
152
normal! zc
119
normal! zc
203
silent! normal! zo
209
silent! normal! zo
let s:l = 227 - ((11 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
227
normal! 011|
lcd ~/Documents/Rails\ Stuff/grading_app
wincmd w
exe '1resize ' . ((&lines * 20 + 20) / 41)
exe '2resize ' . ((&lines * 17 + 20) / 41)
tabedit ~/Documents/Rails\ Stuff/grading_app/app/views/courses/api.html.erb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 17 - ((11 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 044|
lcd ~/Documents/Rails\ Stuff/grading_app
tabedit ~/Documents/Rails\ Stuff/grading_app/app/views/courses/api_example1.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 43 - ((21 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
43
normal! 0
lcd ~/Documents/Rails\ Stuff/grading_app
tabedit ~/Documents/Rails\ Stuff/grading_app/app/models/subpart.rb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 23 - ((16 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
23
normal! 022|
lcd ~/Documents/Rails\ Stuff/grading_app
tabnext 2
if exists('s:wipebuf')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

1wincmd w
tabnext 2
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
