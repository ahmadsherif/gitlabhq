admin = User.seed(:email) do |s|
  s.email = 'admin@local.host'
  s.name = 'Administrator'
  s.username = 'root'
  s.password = '5iveL!fe'
  s.password_confirmation = '5iveL!fe'
  s.password_expires_at = Time.now
  s.theme_id = Gitlab::Theme::MARS
end.first

admin.projects_limit = 10000
admin.admin = true
admin.save!
admin.confirm!

if admin.valid?
puts %q[
Administrator account created:

login.........admin@local.host
password......5iveL!fe
]
end
