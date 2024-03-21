package tn.esprit.pitraining.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tn.esprit.pitraining.entities.Quiz;
import tn.esprit.pitraining.entities.QuizQuestion;
import tn.esprit.pitraining.repositories.QuizQuestionRepository;

import tn.esprit.pitraining.repositories.QuizRepository;



import java.util.List;
import java.util.Optional;

@Service
public class QuizQuestionServiceImpl implements QuizQuestionService {

    private final QuizQuestionRepository quizQuestionRepository;

    private final QuizRepository quizRepository;

    @Autowired
    public QuizQuestionServiceImpl(QuizQuestionRepository quizQuestionRepository, QuizRepository quizRepository) {
        this.quizQuestionRepository = quizQuestionRepository;
        this.quizRepository = quizRepository;
    }

    @Override
    public List<QuizQuestion> getQuestionsByQuizId(Long quizId) {
        return quizQuestionRepository.findByQuizId(quizId);
    }

    @Override
    public Optional<QuizQuestion> getQuestionById(Long quizId, Long id) {
        return quizQuestionRepository.findByIdAndQuizId(id, quizId);
    }

    // ... In your QuizQuestionServiceImpl
    @Override
    public QuizQuestion saveQuestion(QuizQuestion question) {
        Quiz quiz = quizRepository.findById(question.getQuiz().getId()).get(); // Get the associated quiz
        question.setQuiz(quiz); // Establish the bidirectional relationship
        return quizQuestionRepository.save(question);
    }


    @Override
    public QuizQuestion updateQuestion(Long quizId, Long id, QuizQuestion updatedQuestion) {
        Optional<QuizQuestion> existingQuestion = quizQuestionRepository.findByIdAndQuizId(id, quizId);
        if (existingQuestion.isPresent()) {
            updatedQuestion.setId(id); // Set the ID of the updated question
            return quizQuestionRepository.save(updatedQuestion);
        } else {
            throw new ResourceNotFoundException("Quiz question not found with ID: " + id + " for quiz: " + quizId);
        }
    }

    public class ResourceNotFoundException extends RuntimeException {

        public ResourceNotFoundException(String message) {
            super(message);
        }
    }

    @Override
    public void deleteQuestion(Long quizId, Long id) {
        quizQuestionRepository.deleteByIdAndQuizId(id, quizId);
    }
}
