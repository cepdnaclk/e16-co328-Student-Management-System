import requests
import unittest

# POST request to add new student
add_new_res = requests.post(
        "https://greaved-eights.000webhostapp.com/api/addNewStudent.php", 
        data=[
            ('Email', "rusiruthushara@gmail.com"),
            ('Name', "Rusiru Thushara"),
            ('Pass', "123456")
        ])

# GET request to get attendance
get_attendance_res = requests.get(
    "https://greaved-eights.000webhostapp.com/api/getAttendence.php", 
    params={'email': 'rusiruthushara@gmail.com'}
    )


# GET request to get marks
get_marks_res = requests.get(
    "https://greaved-eights.000webhostapp.com/api/getMarks.php",
    params={'email': "rusiruthushara@gmail.com"}
    )

# GET request to get payments
get_payments_res = requests.get(
    "https://greaved-eights.000webhostapp.com/api/getPayments.php",
    params={'email': "rusiruthushara@gmail.com"}
    )
# GET request to get Login
login_res = requests.get(
    "https://greaved-eights.000webhostapp.com/api/login.php",
    params={'email': "test@abc.com"}
)

class UnitTest(unittest.TestCase):

    # Test case for add new student
    def test_addNewStudent(self):
        self.assertEqual(add_new_res.status_code, 200)

    # Test case to add new student
    def test_getAttendace(self):  
        print(get_attendance_res.json()) 
        self.assertEqual(get_attendance_res.status_code, 200)

    # Test case to get marks
    def test_getMarks(self):
        print(get_marks_res.json())
        self.assertEqual(get_marks_res.status_code, 200)
        self.assertEqual(type(get_marks_res.json()['details']), list)

    # Test case to get payments
    def test_getPayments(self):
        self.assertEqual(get_payments_res.status_code, 200)
        self.assertEqual(type(get_payments_res.json()['details']), list)

    # Test case for login
    def test_login(self):
        print(login_res.json())
        self.assertEqual(login_res.status_code, 200)
        self.assertEqual(login_res.json()['response'], 'ok')


if __name__== '__main__':
    unittest.main()