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

Dado('que o ususario altere uma informacao de funcionario') do
    @get_employee = HTTParty.get('https://dummy.restapiexample.com/api/v1/employees', :headers => {'Content-Type': 'application/json'})
    @put_url = 'https://dummy.restapiexample.com/api/v1/update/' + @get_employee['data'][0]['id'].to_s 
end

Quando('ele enviar as novas informacoes') do
  @update_employee = HTTParty.put(@put_url, :headers => {'Content-Type': 'applicantioin/json'}, body: {
    "employee_name": 'naoquerosaberdenada',
    'employee_salary': 333,
    'employee_age': 88,
    'profile_image': '' 
    }.to_json)
end

Então('as informacoe serao alteradas') do
    expect(@update_employee.code).to eql 200
    expect(@update_employee.message).to eql 'OK'
    expect(@update_employee["status"]).to  eql 'success'
    expect(@update_employee['message']). to eql 'Successfully! Record has been updated.'
    expect(@update_employee['data']['employee_name']).to eql 'tutututt'
    expect(@update_employee['data']['employee_salary']).to eql (433060)
    expect(@update_employee['data']['employee_age']).to eql (22)
end

Dado('que o usuario queira deletar') do
    get_employee = HTTParty.get('https://dummy.restapiexample.com/api/v1/employees', :headers => {'Content-Type': 'application/json'})
    @delete_url = 'https://dummy.restapiexample.com/api/v1/update/' + @get_employee['data'][0]['id'].to_s 

Quando('ele enviar a identidade') do
    @delete_employee = HTTParty.delete(@delete_url, :headers => {'Content-Type': 'applicantion/json'})
    puts @delete_employee
end

Entao('esse funcionario vai se apagado do sistema') do
  expect(@delete_employee.code).to eql 200
    expect(@delete_employee.message).to eql 'OK'
    expect(@delete_employee["status"]).to  eql 'success'
    expect(@delete_employee['message']). to eql 'Successfully! Record has been deleted.'
    expect(@delete_employee['data']).to eql '27'
end