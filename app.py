from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Привет, мир! Flask работает!'

if __name__ == '__main__':
    app.run(debug=True)

