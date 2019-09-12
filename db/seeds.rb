specialty = ['oncology', 'internal medicine', 'orthopedic']
10.times do 
  physician = Physician.create(
    name: Faker::Kpop.boy_bands,
    specialty: specialty.sample,
    email: Faker::Internet.email
  )

  patient = Patient.create(
    name: Faker::FunnyName.name,
    age: Faker::Number.number(2),
    email: Faker::Internet.email
  )

  Appointment.create(
    physician_id: physician.id,
    patient_id: patient.id
  )
end

puts 'Data seeded.'