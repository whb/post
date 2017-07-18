# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
xllg = Organization.create(code: '0001', name: '北京祥龙物流（集团）有限公司')
peisong = Organization.create(code: '0002', name: '北京祥龙物流（集团）有限公司配送分公司', superior: xllg)

admin = User.create(username: 'admin', displayname: '系统管理员', password: 'a', enabled: true, organization: xllg, roles: %w[admin staff manager accounting_clerk financial_officer])

r_guandong = Payer.create(code: '0001', name: '中国邮政集团公司广东省分公司', brief_name: '中国邮政集团广州')
r_liuzhou = Payer.create(code: '0002', name: '中国邮政集团公司柳州分公司', brief_name: '中国邮政集团柳州')

e_tongye = Payee.create(code: '0001', name: '统业物流科技集团股份有限公司', brief_name: '统业物流科技集团股份有限公司')
e_jinfeng = Payee.create(code: '0002', name: '广西金锋物流有限公司', brief_name: '广西金锋物流有限公司')