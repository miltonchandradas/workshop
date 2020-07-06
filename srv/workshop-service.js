module.exports = srv => {

    srv.on("READ", "Teams", async (req, next) => {
        const teams = await next();
        return teams.filter(team => team.id !== "Team 205");
    });

    srv.on("READ", "Participants", async (req, next) => {
        const participants = await next();
        return participants.filter(participant => participant.team_id !== "Team 205");
    });

    srv.on("READ", "Projects", async (req, next) => {
        const participants = await next();
        return participants.filter(project => project.team_id !== "Team 205");
    });

    srv.before("CREATE", "Participants", async (req) => {
        const participant = req.data;
        const team = participant.team_id;

        if (team === "Team 205") {
            return req.error(400, "Team 205 has dropped out from the challenge...");
        }

        const { Participants } = cds.entities("demo");
        let participants = await cds.run(SELECT.from(Participants).where({ team_id: team }));

        if (participants.length > 8) {
            return req.error(400, `Sorry, but ${team} is full and is not accepting any more participants...`);
        }
    });
}