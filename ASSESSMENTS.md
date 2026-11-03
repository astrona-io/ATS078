# Quizzes

Each section has a knowledge check in `sections/section-0N0/quiz.yaml`, listed in `astrona.yaml` as a `type: quiz` entry with `pass_score: 70`. `sections/final-domain-quiz.yaml` is the final knowledge check of the domain. Every bank uses `schema_version: 1` and `kind: question_bank`.

## Fields

- `id`: stable bank or question identity; keep it when editing wording.
- `scope`: section or domain.
- `learning_objective`: the measurable outcome checked by the question.
- `source_readings`: author traceability to the teaching, not learner navigation.
- `prompt`: learner-visible question text.
- `options`: stable option IDs, answer text and per-option feedback.
- `correct_option`: the ID of the single correct option.
- `explanation`: feedback that reinforces the supported answer.

The banks contain answer keys and are public learning material, so they are not a secure examination bank. Do not treat scores as an official CNPA result. All banks are draft.
