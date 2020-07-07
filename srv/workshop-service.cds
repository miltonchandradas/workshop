using {demo} from '../db/schema';

service WorkshopService {
    entity Teams        as
        select from demo.Teams
        excluding {
            project
        };

    entity Participants as
        select from demo.Participants {
            *,
            team.coach as coach
        };

    entity Projects     as select from demo.Projects;
}


annotate WorkshopService.Participants with @(UI : {
    HeaderInfo      : {
        TypeName       : 'Participant',
        TypeNamePlural : 'Participants',
        Title          : {
            $Type : 'UI.DataField',
            Value : name
        }
    },
    SelectionFields : [
    id,
    name,
    department,
    coach,
    team_id
    ],
    LineItem        : [
    {
        $Type : 'UI.DataField',
        Value : id
    },
    {
        $Type : 'UI.DataField',
        Value : name
    },
    {
        $Type : 'UI.DataField',
        Value : department
    },
    {
        $Type : 'UI.DataField',
        Value : coach
    },
    {
        $Type : 'UI.DataField',
        Value : team_id
    }
    ]
});

annotate WorkshopService.Participants with {
    id         @(Common : {Label : 'Id'});
    name       @(Common.Label : 'Name');
    department @(Common.Label : 'Department');
    coach      @(Common.Label : 'Coach');
    team       @(Common.Label : 'Team');
}
