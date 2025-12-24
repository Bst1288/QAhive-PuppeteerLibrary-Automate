def cal_tax(income):
    tax = 0
    if income >= 0 and income <= 10000:
        tax = 0
    elif income <= 20000:
        tax = (income - 10000)*0.1
    elif income > 20000:
        tax = (10000*0.1)+((income - 20000)*0.2)
    else:
        print ("Invalid input")
    return tax

user = input("User name: ")
income_input = input("Income (Bath): ")

try:
    income = int(income_input)
    tax = cal_tax(income)
    print(f"{user} เสียภาษี {tax:.0f} THB")
except:
    print("Invalid input")