# Implement a HighScores class with these methods:
#
# scores: returns an array of high scores that was passed in when the object was created
# latest: returns the last member of the high scores array
# personal_best: returns the largest score in the array
# personal_top_three: returns an array of up to three elements containing the highest scores


class HighScores(object):
    def __init__(self, scores):
        self.scores = scores

    def personal_best(self):
        return max(self.scores)

    def personal_top_three(self):
        return sorted(self.scores, reverse=True)[:3]

    def latest(self):
        return self.scores[-1]
