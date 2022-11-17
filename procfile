web: bin/rails server -p ${PORT:-5000} -E $RAILS_ENV
worker: sidekiq
release: bin/rails db:migrate