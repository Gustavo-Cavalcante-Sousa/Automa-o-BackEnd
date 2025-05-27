Dado('que o usuario consulte informacoes de funcionario') do
    @get_url = 'https://dummy.restapiexample.com/api/v1/employees'
end

Quando('ele realizar a pesquisa') do
    @list_employee = HTTParty.get(@get_url)
  
end

Entao('uma lista de funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'
  
end

Dado('que o usuario casdastre um novo usuario') do
  @post_url = 'https://dummy.restapiexample.com/api/v1/create'
end

Quando('ele enviar as informacoes do funcionario') do
    @create_employee = HTTParty.post(@post_url, body: {
            "id": 555,
            "employee_name": "tutututt",
            "employee_salary": 433060,
            "employee_age": 22,
            "profile_image": ""
}.to_json)

puts @create_employee
end

Entao('esse funcionario sera casdastrado') do
    expect(@create_employee.code).to eql 200
    expect(@create_employee.message).to eql 'OK'
    expect(@create_employee["status"]).to  eql 'success'
    expect(@create_employee['message']). to eql 'Successfully! Record has been added.'
    expect(@create_employee['data']['employee_name']).to eql 'tutututt'
    expect(@create_employee['data']['employee_salary']).to eql (433060)
    expect(@create_employee['data']['employee_age']).to eql (22)
end