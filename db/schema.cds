namespace demo;

entity Teams {
    key id: String(50);
    coach: String(50);
    participant: Association to many Participants on participant.team = $self;
    project: Association to Projects;
}

entity Participants {
    key id: String(50);
    name: String(50);
    department: String(50);
    team: Association to Teams;
}

entity Projects {
    key id: UUID;
    name: String(50);
    service: String;
    team: Association to Teams;
}

