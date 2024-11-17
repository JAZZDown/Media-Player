from flask import Flask, jsonify, send_file

app = Flask(__name__)

# Serve media file
@app.route('/media')
def serve_media():
    return send_file('media/sample.mp4', mimetype='video/mp4')

# Serve metadata
@app.route('/metadata')
def serve_metadata():
    metadata = {
        "title": "Sample Video",
        "duration": "2 minutes",
        "format": "mp4"
    }
    return jsonify(metadata)

if __name__ == '__main__':
    app.run(debug=True)
