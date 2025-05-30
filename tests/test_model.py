import pickle
import os

def test_model_prediction():
    # Load model and vectorizer
    with open('app/sentiment_model.pkl', 'rb') as f:
        model = pickle.load(f)
    with open('app/vectorizer.pkl', 'rb') as f:
        vectorizer = pickle.load(f)

    # Sample test input
    test_text = ["This is a great movie!"]
    test_vector = vectorizer.transform(test_text)
    prediction = model.predict(test_vector)[0]

    # Assert prediction is either 0 or 1
    assert prediction in [0, 1]
# tests/test_model.py
def test_dummy():
    assert 1 + 1 == 2
