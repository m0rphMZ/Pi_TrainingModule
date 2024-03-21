package tn.esprit.pitraining.entities;

import jakarta.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data // Lombok annotation for getters, setters, equals, and hashCode
@AllArgsConstructor // Lombok annotation for full constructor
@NoArgsConstructor // Lombok annotation for empty constructor
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Using a generic "id" for the primary key

    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    private Integer passingScore;

    @Enumerated(EnumType.STRING) // Store the actual enum value (e.g., "MULTIPLE_CHOICE")
    private QuizType type; // Type of quiz (e.g., MULTIPLE_CHOICE, TRUE_FALSE)

    @Column(nullable = false)
    private LocalDateTime createdDate = LocalDateTime.now(); // Timestamp of creation

    @OneToMany(mappedBy = "quiz", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<QuizQuestion> questions;

    @ManyToOne(fetch = FetchType.LAZY) // Optional Many-to-One relationship with TrainingContent
    private TrainingContent trainingContent; // User who created the quiz (optional)
}

enum QuizType {
    MULTIPLE_CHOICE,
    TRUE_FALSE,
    FILL_IN_THE_BLANK,
    MATCHING,
    ESSAY
}
