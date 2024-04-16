package tn.esprit.pitraining.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.esprit.pitraining.entities.Quiz;
import tn.esprit.pitraining.entities.QuizQuestion;
import tn.esprit.pitraining.repositories.QuizRepository;


import java.util.List;
import java.util.Optional;

@Service // Mark as a Spring service
public class QuizServiceImpl implements QuizService {

    private final QuizRepository quizRepository;

    @Autowired
    public QuizServiceImpl(QuizRepository quizRepository) {
        this.quizRepository = quizRepository;
    }

    @Override
    public List<Quiz> getAllQuizzes() {
        return quizRepository.findAll();
    }

    @Override
    public Optional<Quiz> getQuizById(Long id) {
        return quizRepository.findById(id);
    }

    @Override
    public Quiz saveQuiz(Quiz quiz) {
        if (quiz.getQuestions() != null && !quiz.getQuestions().isEmpty()) {
            for (QuizQuestion question : quiz.getQuestions()) {
                question.setQuiz(quiz);
            }
        }
        return quizRepository.save(quiz);
    }


    @Override
    public Quiz updateQuiz(Long id, Quiz updatedQuiz) {
        Optional<Quiz> existingQuiz = quizRepository.findById(id);
        if (existingQuiz.isPresent()) {
            updatedQuiz.setId(id); // Set the ID of the updated quiz
            return quizRepository.save(updatedQuiz);
        } else {
            throw new ResourceNotFoundException("Quiz not found with ID: " + id);
        }
    }

    public class ResourceNotFoundException extends RuntimeException {

        public ResourceNotFoundException(String message) {
            super(message);
        }
    }

    @Override
    public void deleteQuiz(Long id) {
        quizRepository.deleteById(id);
    }
}
