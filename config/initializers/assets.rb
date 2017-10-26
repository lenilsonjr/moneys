# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.precompile += %w(
  scripts.js
  jquery.scrollTo.min.js
  jquery.nicescroll.js
  jquery.flot.canvas.min.js
  jquery.flot.animator.min.js
  jquery.dcjqaccordion.2.7.js
  sparkline/jquery.sparkline.js
  jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js
  easypiechart/jquery.easypiechart.min.js
  draggable-portlet.js
  jquery-ui/jquery-ui-1.10.1.custom.min.js
  bootstrap-switch.js
  editable/bootstrap-editable.js
  editable/rails.js
  backoffice/chartkick.js
  Chart.bundle.js
  calendar/moment-2.2.1.js
  calendar/clndr.min.js
  backoffice/dashboard_calendar.js
  underscore-min.js
  backoffice.js
  sounds.js
  jquery.simplecolorpicker.js
)



Rails.application.config.assets.precompile += %w(
  bootstrap-reset.css
  bootstrap-switch.css
  bucket-ico-fonts.css
  font-awesome.min.css
  style-responsive.css
  overrides.css
  style.css
  editable/bootstrap-editable.css
  errors.css
  turquoise-theme.css
  backoffice.css
  print.css
  jquery.simplecolorpicker.css
)

Rails.application.config.assets.precompile += %w(
  filterrific/filterrific-spinner.gif
  logo.png
  maintenance.png
)
