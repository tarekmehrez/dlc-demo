from flask import Flask

app = Flask(__name__)


@app.route('/v1/hello')
def hello_world():
    return 'Hello, Misho!'


if __name__ == "__main__":
    app.run(host='0.0.0.0')
