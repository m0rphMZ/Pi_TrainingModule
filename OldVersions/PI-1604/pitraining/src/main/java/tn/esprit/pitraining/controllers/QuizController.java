package tn.esprit.pitraining.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import tn.esprit.pitraining.entities.Quiz;
import tn.esprit.pitraining.services.QuizService;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/quizzes") // Base path for all quiz-related requests
public class QuizController {

    private final QuizService quizService;

    @Autowired
    public QuizController(QuizService quizService) {
        this.quizService = quizService;
    }

    // Get all quizzes
    @GetMapping
    public List<Quiz> getAllQuizzes() {
        return quizService.getAllQuizzes(); // Delegate to service method
    }

    // Get a specific quiz by ID
    @GetMapping("/{id}")
    public Optional<Quiz> getQuizById(@PathVariable Long id) {
        return quizService.getQuizById(id); // Delegate to service method
    }

    // Save a new quiz
    @PostMapping
    public Quiz createQuiz(@RequestBody Quiz quiz) {
        return quizService.saveQuiz(quiz); // Delegate to service method
    }

    // Update a quiz (replace entire quiz object)
    @PutMapping("/{id}")
    public Quiz updateQuiz(@PathVariable Long id, @RequestBody Quiz updatedQuiz) {
        return quizService.updateQuiz(id, updatedQuiz); // Delegate to service method
    }

    // Delete a quiz by ID
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT) // Indicate successful deletion without content
    public void deleteQuiz(@PathVariable Long id) {
        quizService.deleteQuiz(id); // Delegate to service method
    }

    // Custom exception handler for ResourceNotFoundException (remains the same)
}
