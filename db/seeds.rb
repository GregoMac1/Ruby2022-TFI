Branch.create(name: "Casa Matriz", address: "Av. 9 de Julio 1234", phone: "1132646548")
Branch.create(name: "Sucursal 1", address: "Av. Corrientes 2354", phone: "1165982354")
Branch.create(name: "Sucursal 2", address: "Av. Independencia 6544", phone: "1165986554")

Schedule.create(branch_id: 1, day: "Lunes", start: "08:00", end: "15:00")
Schedule.create(branch_id: 1, day: "Martes", start: "08:00", end: "15:00")
Schedule.create(branch_id: 1, day: "Miércoles", start: "08:00", end: "15:00")
Schedule.create(branch_id: 1, day: "Jueves", start: "08:00", end: "15:00")
Schedule.create(branch_id: 1, day: "Viernes", start: "08:00", end: "15:00")
Schedule.create(branch_id: 1, day: "Sábado", start: "08:00", end: "12:00")

Schedule.create(branch_id: 2, day: "Lunes", start: "08:00", end: "15:00")
Schedule.create(branch_id: 2, day: "Miércoles", start: "08:00", end: "15:00")
Schedule.create(branch_id: 2, day: "Jueves", start: "08:00", end: "15:00")
Schedule.create(branch_id: 2, day: "Sábado", start: "08:00", end: "12:00")

Schedule.create(branch_id: 3, day: "Martes", start: "08:00", end: "15:00")
Schedule.create(branch_id: 3, day: "Miércoles", start: "08:00", end: "15:00")
Schedule.create(branch_id: 3, day: "Jueves", start: "08:00", end: "15:00")
Schedule.create(branch_id: 3, day: "Viernes", start: "08:00", end: "15:00")

admin = User.create(email: "juan@gmail.com", name: "Juan Pérez", password: "Ruby2022")
manager = User.create(email: "carlos@gmail.com", name: "Carlos Sánchez", password: "Ruby2022")
client = User.create(email: "marcos@gmail.com", name: "Marcos García", password: "Ruby2022")

#the client role is added by default
admin.remove_roles
admin.add_role :admin

manager.remove_roles
manager.update(branch_id: 1)
manager.add_role :manager
