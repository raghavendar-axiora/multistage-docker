from flask import Flask, request

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def home():
    if request.method == "POST":
        user_input = request.form.get("user_input")
        return f"<h2>You entered: {user_input}</h2>"
    return '''
        <form method="POST">
            <label>Enter something:</label>
            <input type="text" name="user_input">
            <input type="submit" value="Submit">
        </form>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
