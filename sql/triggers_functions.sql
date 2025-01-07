-- Function to update claim result based on traceability

CREATE OR REPLACE FUNCTION updateClaimResult() RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT * FROM claim r
        WHERE r.id = NEW.claim
        AND r.year = NEW.year
        AND NEW.status = 'NOTIFIED'
        AND NEW.end_date IS NOT NULL
    ) THEN
        UPDATE claim r SET result = ROUND(RANDOM() + 1)
        WHERE r.id = NEW.claim
        AND r.year = NEW.year;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to call updateClaimResult after insert or update on traceability

CREATE TRIGGER trigger_updateClaimResult
AFTER INSERT OR UPDATE ON traceability
FOR EACH ROW EXECUTE PROCEDURE updateClaimResult();

-- Function to add measures based on claim result

CREATE OR REPLACE FUNCTION addMeasures() RETURNS TRIGGER AS $$
DECLARE
    quantity INT := ROUND(RANDOM() * 5 + 0.5);
BEGIN
    IF (NEW.result = 1) THEN
        FOR i IN 1..quantity LOOP
            INSERT INTO action (claim, year) VALUES (NEW.id, NEW.year);
        END LOOP;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to call addMeasures after insert or update on claims
CREATE TRIGGER trigger_addMeasures
AFTER INSERT OR UPDATE ON claim
FOR EACH ROW EXECUTE FUNCTION addMeasures();
