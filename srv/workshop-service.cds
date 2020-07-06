using {demo} from '../db/schema';

service WorkshopService {
    entity Teams as SELECT from demo.Teams excluding {project};

    entity Participants as SELECT from demo.Participants {*,
        team.coach as coach
    };
    entity Projects as SELECT from demo.Projects;
}
